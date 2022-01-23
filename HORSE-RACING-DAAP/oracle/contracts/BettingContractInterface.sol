// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface BettingContractInterface{
    function callback(uint256 _winner,uint256 _id) external;
}