import web3

for i in range(2 ** 8):
    print(i, web3.Web3.soliditySha3(["uint8"], [i]))
