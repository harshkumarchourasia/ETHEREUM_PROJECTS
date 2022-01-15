// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Token C = Platinum Token
contract PlatinumToken is ERC20{
    constructor(string memory name,string memory symbol) ERC20(name,symbol){
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }
    function mint(address _address, uint amount) public {
        _mint(_address, amount);
    }
    function burn(address _address, uint amount) public{
        _burn(_address,amount);
    }
}