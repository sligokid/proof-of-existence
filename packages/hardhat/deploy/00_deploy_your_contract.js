// deploy/00_deploy_your_contract.js

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();
  await deploy("LandRegistry", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    args: ["0xae8B7983553F17313c060460Cc0d96b12D19eFdf"],
    log: true,
  });

  //const LandRegistry = await ethers.getContractAt('LandRegistry', "0xaAC799eC2d00C013f1F11c37E654e59B0429DF6A")

  /*
    // Getting a previously deployed contract
    const LandRegistry = await ethers.getContract("LandRegistry", deployer);
    await LandRegistry.UpdateEventWindow("Hello");
    
    //const LandRegistry = await ethers.getContractAt('LandRegistry', "0xaAC799eC2d00C013f1F11c37E654e59B0429DF6A") //<-- if you want to instantiate a version of a contract at a specific address!
  */
};
module.exports.tags = ["LandRegistry"];

/*
Tenderly verification
let verification = await tenderly.verify({
  name: contractName,
  address: contractAddress,
  network: targetNetwork,
});
*/
