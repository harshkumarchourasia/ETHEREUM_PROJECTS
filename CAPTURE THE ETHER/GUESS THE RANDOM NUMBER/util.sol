// SPDX-License-Identifier: MIT
pragma solidity ^0.4.21;

contract Solution {
    function returnHash() public pure returns (uint8) {
        return
            uint8(
                uint256(
                    keccak256(
                        abi.encode(
                            0x8b6987898ba047b84a613387b70d6ddd2033819016940189a11da6dcb29f6b13,
                            1639429111
                        )
                    )
                )
            );
    }
}
