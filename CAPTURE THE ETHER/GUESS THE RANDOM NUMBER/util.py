from web3 import Web3
import web3

node_provider = "https://ropsten.infura.io/v3/5e9731cc1b6c40b4b9e81b8a1c67c05b"
web3_connection = Web3(Web3.HTTPProvider(node_provider))


def are_we_connected():
    return web3_connection.isConnected()


contract_address = "0xeF4a2c8e84A77169076a4d80eaDdd1672958f8d4"
print("connected:", are_we_connected())
print(web3_connection.eth.get_block(11611974))
# get the block.timestamp and block.parentHash form here.
#use solidity to calculate answer
