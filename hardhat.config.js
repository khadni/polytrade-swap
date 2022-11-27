require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: "polygonMumbai",
  networks: {
    polygonMumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/sRBF-kpXbegMtWV2JcPEDDNerV69nUst",
      accounts: [process.env.PRIVATE_KEY],
      chainId: 80001,
    },
  },
  etherscan: {
    apiKey: {
      polygonMumbai: [process.env.POLYGONSCAN_API_KEY],
    },
  },
};
