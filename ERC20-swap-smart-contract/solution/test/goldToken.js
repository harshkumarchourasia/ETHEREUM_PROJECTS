const GoldToken = artifacts.require('GoldToken');
const BN = require('bn.js');    
contract('GoldToken',()=>{
    it('gold token smart contract deployed properly', async()=>{
        const goldToken = await GoldToken.new("GOLD","G");
        assert(goldToken.address !=='' );
    })
})
contract('GoldToken',(accounts)=>{
    it('gold token name and symbol correct', async()=>{
        const goldToken = await GoldToken.new("GOLD","G");
        assert(await goldToken.symbol()==='G');
        assert(await goldToken.name()==='GOLD');
    })
})
contract('GoldToken',(accounts)=>{
    it('gold token initial balance correct', async()=>{
        const goldToken = await GoldToken.new("GOLD","G");
        initialCoin = await goldToken.balanceOf(accounts[0]);
        assert(BigInt(initialCoin)==BigInt(10000000000000000000000));
       
    })
})