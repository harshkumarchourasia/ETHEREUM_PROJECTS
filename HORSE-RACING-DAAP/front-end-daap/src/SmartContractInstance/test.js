/*import {queryBet} from './Betting.js';

  (async()=>{ 
    let res;
    res = await queryBet("0x219A7beb71BfA859Fe1647d47fFE87712Be7F910")
    console.log('bet: ',res)
   })()
   */
   const web3 = require("web3");
   const selector = web3.eth.abi.encodeFunctionSignature({
    type: "function",
    name: yourObj.funcName,
    inputs: yourObj.params.map(param => ({type: param}))
});
console.log(selector)