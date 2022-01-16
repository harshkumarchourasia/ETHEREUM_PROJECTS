const PlatinumToken = artifacts.require('PlatinumToken');
const BN = require('bn.js');    
contract('PlatinumToken',()=>{
    it('platinum token smart contract deployed properly', async()=>{
        const platinumToken = await PlatinumToken.new("PLATINUM","P");
        assert(platinumToken.address !=='' );
    })
})
contract('PlatinumToken',(accounts)=>{
    it('platinum token name and symbol correct', async()=>{
        const platinumToken = await PlatinumToken.new("PLATINUM","P");
        assert(await platinumToken.symbol()==='P');
        assert(await platinumToken.name()==='PLATINUM');
    })
})
contract('PlatinumToken',(accounts)=>{
    it('platinum token initial balance correct', async()=>{
        const platinumToken = await PlatinumToken.new("GOLD","G");
        initialCoin = await platinumToken.balanceOf(accounts[0]);
        assert(BigInt(initialCoin)==BigInt(100000000000000000000));
    })
})