import { expect } from "chai";
import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import type { Signer } from "ethers";
import { ethers } from "hardhat";
describe("Token contract", function () {
  async function deployVoteFixture(){
    // Get the Signers here.
    const [owner, voter1, voter2] = await ethers.getSigners();

    // Deploy the VotingSystem contract
    const VotingSystem = await ethers.getContractFactory("VotingSystem");
    const votingSystem = await VotingSystem.deploy();
     votingSystem.target

    // Fixtures can return anything you consider useful for your tests
    return { votingSystem, owner, voter1, voter2 };
  }

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      const { votingSystem, owner } = await loadFixture(deployVoteFixture);
      expect(await votingSystem.owner()).to.equal(owner.address);
    });
  });
});