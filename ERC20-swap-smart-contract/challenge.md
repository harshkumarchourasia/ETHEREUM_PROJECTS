# Multitoken Wrapping

The challenge is to create a token swapping Solidity smart contract and deploy it on Avalanche. The user should be able to swap either of two ERC20s for a single ERC20 token. For example, you can swap token A or token B for token C. Swaps should also be possible in the reverse direction.Token C should be redeemable for token A or token B. Token exchange rates are one-to-one. Input side ERC20 tokens do not need to swappable for each other. You do not need a method to swap token A for token B.

A || B <==> C

## Provided Stub
Attached is a Solidity stub for the Wrapper contract. It contains two methods: `function swap(address token_, uint amount)` and `function unswap(address token_, uint amount)`. Please implement these methods. Feel free to add whatever other methods and contracts are necessary.

## Token Parameters

Please give each token its own unique name and symbol. Do not name them tokens A, B, and C. Tokens may all have the same number of decimals.

### Token Minting

Tokens A and B should be minted outside of wrapper contract. The wrapper contract should not be able to mint any new A or B tokens. Token C, however, should be minted exclusively from inside the Wrapper contract.

## External resources

Feel free to use any code from OpenZeppelin. You may import their contracts into your own or deploy theirs without modifications. Please refrain from using code from any other source.

## Deliverables
1. Source code for your deployed Wrapper contract, tokens A, B, C, and any other contracts you deploy as part of your solution.
2. The MUMBAI deployment address of each contract delivered in 1.
3. A pseudocode call sequence for the correct order and arguments to deploy all contracts and swap 100 token A for token C, then convert 50 token C to token B.

### Example Call Sequence
1. Deploy TokenA(arg1, arg2)
2. Deploy Wrapper()
3. Wrapper.swap(TokenA.address, 100)