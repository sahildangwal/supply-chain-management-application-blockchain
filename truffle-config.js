require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
    },
    mainnet: {
      provider: () => new HDWalletProvider({
        mnemonic: {
          phrase: process.env.MNEMONIC, 
        },
        providerOrUrl: ganache.provider(), 
      }),
      network_id: 1, 
      gas: 8000000, 
      gasPrice: 20000000000, 
      confirmations: 2,
      timeoutBlocks: 200,
    },
  },
  compilers: {
    solc: {
      version: "0.8.17", 
    },
  },
};
