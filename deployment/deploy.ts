import { ethers} from "hardhat";

async function main(): Promise<void> {
  const VotingSystem = await ethers.getContractFactory("VotingSystem");
  const voting = await VotingSystem.deploy();

  console.log("Voting contract deployed to:", voting.target);
   const deploymentTransaction = voting.deploymentTransaction();
    if (deploymentTransaction) {
      await deploymentTransaction.wait(6);
    }
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });