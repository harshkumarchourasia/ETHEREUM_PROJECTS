// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./BettingContractInterface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WinnerOracle is Ownable {
  uint private randNonce = 0;
  uint private modulus = 1000;
  mapping(uint256=>bool) pendingRequests;
  event GetWinnerEvent(address callerAddress, uint id);
  event SetWinnerEvent(uint256 winner, address callerAddress);
  function getWinner() public returns (uint256) {
    randNonce++;
    uint id = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % modulus;
    pendingRequests[id] = true;
    emit GetWinnerEvent(msg.sender, id);
    return id;
  }
  function setWinner(uint256 _winner, address _callerAddress, uint256 _id) public onlyOwner {
    require(pendingRequests[_id], "This request is not in my pending list.");
    delete pendingRequests[_id];
    BettingContractInterface bettingContractInstance;
    bettingContractInstance = BettingContractInterface(_callerAddress);
    bettingContractInstance.callback(_winner, _id);
    emit SetWinnerEvent(_winner, _callerAddress);
  }
}
