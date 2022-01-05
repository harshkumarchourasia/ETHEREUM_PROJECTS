// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface OracleInterface{
   function receiveRequest() external returns (uint256);
}
contract BaseContract{
  uint public randomNumber = 0;
  OracleInterface public obj;
  mapping(uint256=>bool) myRequests;
    constructor( address _address){
        obj = OracleInterface(_address);
    }
    function requestOracle() public{
        uint requestId = obj.receiveRequest();
        myRequests[requestId] = true;
    }
    function callback(uint256 _randomNumber, uint256 _requestId) public  {
        require(myRequests[_requestId], "This request is not in my pending list.");
        randomNumber = _randomNumber;
        delete myRequests[_requestId];
      }
}