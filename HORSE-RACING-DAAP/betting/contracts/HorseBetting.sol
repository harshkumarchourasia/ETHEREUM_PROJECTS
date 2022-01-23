// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./getWinnerOracleInterface.sol";
contract HorseBetting is Ownable{
    using SafeMath for uint;
    //address owner;
    uint[] horses = [1, 2, 3, 4];
    mapping(address=>uint) public balanceOf;
    mapping(address=>uint) public bettingOn;
    address[] public betters;
    bool public matchCreated = false;
    uint public matchTime;
    uint public winner;
    uint public id; 
    uint public totalBet=0;
    uint public totalBetOnWinner;
    address private oracleAddress;
    GetWinnerOracleInterface public oracleInstance;
    event ReceivedNewRequestIdEvent(uint256 id);
    event WinnerUpdatedEvent(uint256 winner, uint256 id);
    mapping(uint256=>bool) myRequests;
    constructor(){
        address _address = 0x2EdEd01bec172Cc37c00C29d730D663B37256842;
        oracleInstance = GetWinnerOracleInterface(_address);
    }

    function createMatch(uint _matchTime) external onlyOwner{
        require(matchCreated==false,"one match at a time");
        matchCreated = true;
        matchTime = block.timestamp.add(_matchTime);
    }
    function collectFunds(uint _bettingOnIdx) external payable{
        require(msg.value>0,"Atlest 1 wei is required for participation");
        require(balanceOf[msg.sender]==0,"You have already placed your bet");
        require(matchCreated,"No current match is available");
        require(_bettingOnIdx<horses.length,"horse not present");
        balanceOf[msg.sender]=msg.value;
        bettingOn[msg.sender]=horses[_bettingOnIdx];
        betters.push(msg.sender);
        totalBet+=msg.value;
    }
    function matchResult() public returns (uint){
        require(winner!=0,"Please get the winner first");
        require(matchCreated,"No current match is available");
        require(block.timestamp<matchTime,"Match has not yet finished");
        //winner = 1;
        uint temp;

        for(uint idx=0;idx<betters.length;idx++){
             if(bettingOn[betters[idx]]==winner){
                 temp=balanceOf[betters[idx]];
                 totalBetOnWinner+=temp;
             }
        }
        for(uint idx=0;idx<betters.length;idx++){
            if(bettingOn[betters[idx]]==winner){
                
                balanceOf[betters[idx]]=totalBet*(balanceOf[betters[idx]]/totalBetOnWinner);
                //bettingOn[betters[idx]]=0;
            }
             else{
                 //bettingOn[betters[idx]]=0;
                 balanceOf[betters[idx]]=0;
             }
        }
        return winner;
    }
    function sendFunds() public payable{
        uint amountToSend = balanceOf[msg.sender];
        balanceOf[msg.sender]=0;
        payable(msg.sender).transfer(amountToSend);
    }
    function getWinner() public{
        id = oracleInstance.getWinner();
        myRequests[id] = true;
        emit ReceivedNewRequestIdEvent(id);
    }
    function callback(uint256 _winner, uint256 _id) public  {
        require(myRequests[_id], "This request is not in my pending list.");
        winner = _winner;
        delete myRequests[_id];
        emit WinnerUpdatedEvent(_winner, _id);
      }
    modifier onlyOracle() {
      require(msg.sender == oracleAddress, "You are not authorized to call this function.");
      _;
    }
    receive() external payable{}
    fallback() external payable{}

}