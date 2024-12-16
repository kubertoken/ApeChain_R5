const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Reviewfy", function () {
  it("Should validate the addresses", async function () {
    // deploy a lock contract where funds can be withdrawn
    // one year in the future
    const apeChainLink = await hre.ethers.deployContract("Reviewfy");

    
    // assert that the value is correct
    expect(await apeChainLink.calculateTotalAmount(1)).to.equal(1 * 100000000000000000);
  });
});
