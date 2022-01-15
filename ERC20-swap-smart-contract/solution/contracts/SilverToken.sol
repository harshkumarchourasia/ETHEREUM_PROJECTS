// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//Token B = Silver Token
contract SilverToken is ERC20{
    constructor(string memory name,string memory symbol) ERC20(name,symbol){
        _mint(msg.sender, 10000 * 10**uint(decimals()));
    }
}