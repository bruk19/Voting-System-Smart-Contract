import { expect } from "chai";
import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
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

  describe("createVoteSystem", function () {
    it("Should create a new vote system", async function () {
      const { votingSystem } = await loadFixture(deployVoteFixture);

      const voteName = "Election";
      const votedNameList = ["Candidate A", "Candidate B", "Candidate C"];
      const timeDuration = 7; // 7 days

      await votingSystem.createVoteSystem(voteName, votedNameList, timeDuration);

      const createdVoteList = await votingSystem.getVoteNames();
      expect(createdVoteList).to.deep.include(voteName);

      const votedList = await votingSystem.getVotedList(voteName);
      expect(votedList).to.deep.equal(votedNameList);
    });
  });

 describe("voting", function () {
  it("Should increment the vote count for the selected candidate", async function () {
    const { votingSystem, voter1 } = await loadFixture(deployVoteFixture);

    const voteName = "Election";
    const candidate = "Candidate A";
    const timeDuration = 7; // 7 days

    await votingSystem.createVoteSystem(voteName, [candidate], timeDuration);

    await votingSystem.connect(voter1).voting(voteName, candidate);

    const voteCount = await votingSystem.getVoteValue(voteName, candidate);
    expect(voteCount).to.equal(1);
  });
});

  
});