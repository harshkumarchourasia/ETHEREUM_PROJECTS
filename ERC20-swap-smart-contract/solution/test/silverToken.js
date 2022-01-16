const SilverToken = artifacts.require('SilverToken');
const BN = require('bn.js');    
contract('SilverToken',()=>{
    it('silver token smart contract deployed properly', async()=>{
        const silverToken = await SilverToken.new("SILVER","S");
        assert(silverToken.address !=='' );
    })
})
contract('SilverToken',(accounts)=>{
    it('silver token name and symbol correct', async()=>{
        const silverToken = await SilverToken.new("SILVER","S");
        assert(await silverToken.symbol()==='S');
        assert(await silverToken.name()==='SILVER');
    })
})
contract('SilverToken',(accounts)=>{
    it('silver token initial balance correct', async()=>{
        const silverToken = await SilverToken.new("SILVER","S");
        initialCoin = await silverToken.balanceOf(accounts[0]);
        assert(BigInt(initialCoin)==BigInt(10000000000000000000000));
       
    })
})