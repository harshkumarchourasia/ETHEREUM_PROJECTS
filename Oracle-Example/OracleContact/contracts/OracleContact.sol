// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface BaseInterface {
   function callback(uint256, uint256) external ;
}
contract Oracle  {
  uint public requestId = 0;
  mapping(uint256=>bool) pendingRequests;
  event GetEvent(address baseAddress, uint requestId);
  BaseInterface obj;
  function receiveRequest() public returns (uint256) {
    requestId++;  
    pendingRequests[requestId] = true;
    emit GetEvent(msg.sender, requestId);
    return requestId;
  }

  function returnRequest(uint256 _randomNumber, address _baseAddress, uint256 _requestId) public{
    require(pendingRequests[_requestId], "This request is not in my pending list.");
    delete pendingRequests[_requestId];
    obj = BaseInterface(_baseAddress);
    obj.callback(_randomNumber, _requestId);
  }
}