const Swapper = artifacts.require('Swapper');
contract('Swapper',()=>{
    it('swapper smart contract deployed properly', async()=>{
        const swapper = await Swapper.new(
        "0x32247d29c61cFA915a4717645e98BD829aC94b41",
        "0x65eE794976918f5807ae2b4b5f4334B3C9B1dB4f",
        "0x5B669E6058B69C1d08aE2a8A1C11F2D259454323");
        assert(swapper.address !=='' );
    })
})