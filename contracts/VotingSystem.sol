//SPDX-License-Identiffier: MIT
pragma solidity ^0.8.8;

contract VotingSystem {
    struct Vote {
        address voteCreater;
        string[] votedList;
        uint timeDuration;
        mapping(string => uint) numVoted;
        address[] voterAddress;
        bool isTimeDuration;
        bool isVoted;
    }

    address public owner;
    mapping(string => Vote) public voteInfo;
    string[] public createdVoteList;

    constructor() {
        owner = msg.sender;
    }

    function createVoteSystem(string memory _voteName, string[] memory _votedNameList, uint _timeDuration) public {
      
    }
}
