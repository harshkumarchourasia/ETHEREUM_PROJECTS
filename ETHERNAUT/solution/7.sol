// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ForceSend{
    constructor() payable{
        require(msg.value==1);
    }
    function send_ether(address _address) public payable{
        selfdestruct(payable(_address));
    }
}