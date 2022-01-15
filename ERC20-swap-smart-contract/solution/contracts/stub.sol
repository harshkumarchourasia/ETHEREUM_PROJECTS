
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
interface IERC20MB {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function mint(address _address, uint amount) external;
    function burn(address _address, uint amount) external;
}
contract Swapper{
    IERC20 public gold;
    IERC20 public silver;
    IERC20MB public platinum;
    constructor(address _g_address,address _s_address, address _p_address){
        gold = IERC20(_g_address);
        silver = IERC20(_s_address);
        platinum = IERC20MB(_p_address);
    }
    function allowance(string memory coin)public view returns(uint){
        if(keccak256(bytes(coin))==keccak256(bytes("gold"))){
            return gold.allowance(msg.sender, address(this));
        }
        else if(keccak256(bytes(coin))==keccak256(bytes("silver"))){
            return silver.allowance(msg.sender, address(this));
        }
        else if(keccak256(bytes(coin))==keccak256(bytes("platinum"))){
            return platinum.allowance(msg.sender, address(this));
        }
        else{
            return uint(0);
        }
    }
    function swap(string memory token_, uint amount) external {
         if(keccak256(bytes(token_))==keccak256(bytes("gold"))){
            require(allowance("gold")>=amount,"Please allow this contract to transfer funds");
            gold.transferFrom(msg.sender, address(this), amount);
            platinum.mint(msg.sender,amount);
        }
        else if(keccak256(bytes(token_))==keccak256(bytes("silver"))){
            require(allowance("silver")>=amount,"Please allow this contract to transfer funds");
            silver.transferFrom(msg.sender, address(this), amount);
            platinum.mint(msg.sender,amount);
        }
    }
    function unswap(string memory token_, uint amount) external {
        require(allowance("platinum")>=amount,"Please allow this contract to transfer funds");
        if(keccak256(bytes(token_))==keccak256(bytes("gold"))){
            require(gold.balanceOf(address(this))>=amount,"Please allow this contract to transfer funds");
            platinum.transferFrom(msg.sender, address(this), amount);
            platinum.burn(address(this),amount);
            gold.transfer(msg.sender, amount);
        }
        else if(keccak256(bytes(token_))==keccak256(bytes("silver"))){
            require(silver.balanceOf(address(this))>=amount,"Please allow this contract to transfer funds");
            platinum.transferFrom(msg.sender, address(this), amount);
            platinum.burn(address(this),amount);
            silver.transfer(msg.sender, amount);
        }
    }
}