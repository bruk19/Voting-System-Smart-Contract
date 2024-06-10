# Voting System Smart Contract

> This Solidity smart contract, named VotingSystem, provides a decentralized voting platform where users can create voting systems, cast their votes, and view the voting results.

## Features
- Create Voting System: The contract allows users to create a new voting system by providing a unique vote name, a list of candidate names, and the duration of the voting period.
- Vote: Users can cast their votes for a specific candidate in a created voting system, as long as the voting period is still active and the user has not already voted.
- View Voting Results: The contract provides several functions to view the voting results, including the list of created voting systems, the number of votes for each candidate, the total number of voters, and the list of voters.


## Built With

- Major: TypeScript, Solidity
- Frameworks: Hardhat
- Technologies: Git, Gitflow, Linters, Github

## Live Demo ()

[Live Demo Link](https://sepolia.etherscan.io/address/0xb95C1aA1Cf85523dbF4008E4FA81C3dCb274b77F#code)

## Functionality
Contract Structure
The contract has the following key elements:

- Vote struct: Represents a single voting system, storing information such as the vote creator, list of candidates, voting duration, number of votes for each candidate, list of voters, and voting status.
- voteInfo mapping: Stores the Vote struct for each created voting system, indexed by the vote name.
- createdVoteList: A list of all created voting systems.
owner: The address of the contract owner.

## Functions
1. createVoteSystem(string memory _voteName, string[] memory _votedNameList, uint _timeDuration): Allows the user to create a new voting system.
2. checkVoteName(string memory _voteName): Checks if a given vote name has already been used for another voting system.
3. voting(string memory _voteName, string memory _votedName): Allows a user to cast their vote for a specific candidate in a given voting system.
4. IsVoteNameCreated(string memory _voteName): Checks if a given vote name has been used to create a voting system.
5. isAddressVoted(string memory _voteName): Checks if a user has already voted in a given voting system.
6. checkVotedNameList(string memory _voteName, string memory _votedName): Checks if a given candidate name is in the list of candidates for a specific voting system.
7. getVoteNames(): Returns the list of all created voting systems.
8. getVoterAddress(string memory _voteName): Returns the list of all voter addresses for a given voting system.
9. getVoteValue(string memory _voteName, string memory _votedName): Returns the number of votes for a specific candidate in a given voting system.
10. getVoterNumber(string memory _voteName): Returns the total number of voters in a given voting system.
11. getVotedList(string memory _voteName): Returns the list of all candidates in a given voting system.
12. getVotingTime(string memory _voteName): Returns the voting duration for a given voting system.

## Usage
- Deploy the VotingSystem contract to the Ethereum network.
Use the createVoteSystem function to create a new voting system, providing a unique vote name, a list of candidate names, and the voting duration.
- Users can call the voting function to cast their votes for a specific candidate in a given voting system, as long as the voting period is still active and the user has not already voted.
- Use the provided view functions to retrieve information about the created voting systems, such as the list of candidates, the number of votes for each candidate, the total number of voters, and the list of voters.



## Getting Started


To get a local copy up and running follow these simple example steps.

### Prerequisites
- Have a computer and internet connection
- Have a basic knowledge of TypeScript
- Have a basic knowledge of Solidity
- Have a general understanding of what testing is
- Have visual-studio code or any other code editor installed on your computer.

### Setup
- Open your terminal in the folder where you want to have the project and run `git clone git@github.com:bruk19/Voting-System-Smart-Contract.git` to clone the project.
- Run `Voting-System-Smart-Contract` to move to the project directory.



### Run tests
- Run `yarn test`

## Author
👤 **Bruk Teshome**

- GitHub: [@githubhandle](https://github.com/bruk19)
- Twitter: [@twitterhandle](https://twitter.com/Bruktesh)
- LinkedIn: [LinkedIn](https://linkedin.com/in/bruk-teshome)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/bruk19/Voting-System-Smart-Contract/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._
