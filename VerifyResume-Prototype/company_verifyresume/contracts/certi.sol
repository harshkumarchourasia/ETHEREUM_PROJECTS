// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Certificate {
    string company;
    struct Certi {
        string candidate;
        string designation;
    }
    Certi[] public certis;
    constructor(string memory _company) {
        company = _company;
    }
}

contract NFT is Certificate, ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() Certificate("APS") ERC721("harsh","h") {}
    function addCerti(address _candidate_add,string memory _candidate, string memory _designation) public returns(uint256){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        certis.push(Certi(_candidate,_designation));
        _mint(_candidate_add,newItemId);
        return newItemId;
    }

}