require("@nomicfoundation/hardhat-toolbox");
require("@openzeppelin/hardhat-upgrades");


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  paths: {
    sources: "./contracts",
    artifacts: "./artifacts",
    cache: ".cache",
    cacheSources: ".cache/src",
    spec: "./spec",
    typescript: "./types",
    imports: {
      hardfork: "^(.*)$",
      fallback: "^(.*\\.json)$|^(.*\\.bin)$|^(.*\\.asm)$|^(.*\\.wasm)$|^(.*\\.dat)$|^(.*\\.txt)$|^(.*\\.md)$|^(.*\\.y4:0)$",
      openzeppelin: "@openzeppelin",
      ethers: "https://unpkg.com/@ethersproject/contracts@latest"
    }
  },
  networks: {
    apechain: {
      url: "https://curtis.rpc.caldera.xyz/http",
      accounts: [], // Add account private key here
    },
  }
};
