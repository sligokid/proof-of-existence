const { ethers } = require("hardhat");
const { use, expect } = require("chai");
const { solidity } = require("ethereum-waffle");

use(solidity);

describe("My Dapp", function () {
  let myContract;

  describe("LandRegistry", function () {
    it("Should deploy LandRegistry", async function () {
      const LandRegistry = await ethers.getContractFactory("LandRegistry");

      myContract = await LandRegistry.deploy();
    });

    describe("UpdateEventWindow()", function () {
      it("Should be able to set a new purpose", async function () {
        const newPurpose = "Test Purpose";

        await myContract.UpdateEventWindow(newPurpose);
        expect(await myContract.purpose()).to.equal(newPurpose);
      });
    });
  });
});
