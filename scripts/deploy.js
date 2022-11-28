const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const AlphaTokens = await ethers.getContractFactory("AlphaTokens");
  const alphaTokens = await AlphaTokens.deploy();
  const BetaTokens = await ethers.getContractFactory("BetaTokens");
  const betaTokens = await BetaTokens.deploy();

  console.log("AlphaTokens address:", alphaTokens.address);
  console.log("BetaTokens address:", betaTokens.address);

  const Swapper = await ethers.getContractFactory("Swapper");
  const swapper = await Swapper.deploy(alphaTokens.address, betaTokens.address);

  console.log("Swapper address:", swapper.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
