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

    event _createVoteSystem(
        string voteName,
        string[] _voteNameList,
        uint _timeDuration
    );

    event _voting(address _voter, string _voteName, string _votedName);

    function createVoteSystem(
        string memory _voteName,
        string[] memory _votedNameList,
        uint _timeDuration
    ) public {
        require(checkVoteName(_voteName), "Vote Name is already created");
        Vote storage vote = voteInfo[_voteName];

        vote.voteCreater = msg.sender;
        createdVoteList.push(_voteName);
        vote.timeDuration = block.timestamp + _timeDuration * 1 days;

        for (uint i = 0; i < _votedNameList.length; i++) {
            vote.votedList.push(_votedNameList[i]);
        }
        emit _createVoteSystem(_voteName, _votedNameList, _timeDuration);
    }

    function checkVoteName(string memory _voteName) public view returns (bool) {
        for (uint i = 0; i < createdVoteList.length; i++) {
            if (
                keccak256(bytes(createdVoteList[i])) ==
                (keccak256(bytes(_voteName)))
            ) {
                return false;
            }
        }
        return true;
    }

    function voting(string memory _voteName, string memory _votedName) public {
        Vote storage vote = voteInfo[_voteName];
        require(IsVoteNameCreated(_voteName), "The vote is not created");
        require(block.timestamp <= vote.timeDuration, "The voting time is end");
        require(isAddressVoted(_voteName), "the address is already vote");
        vote.voterAddress.push(msg.sender);
        vote.numVoted[_voteName]++;
        vote.isVoted = true;

        emit _voting(msg.sender, _voteName, _votedName);
    }

    function IsVoteNameCreated(
        string memory _voteName
    ) public view returns (bool) {
        for (uint i = 0; i < createdVoteList.length; i++) {
            if (
                keccak256(bytes(createdVoteList[i])) ==
                (keccak256(bytes(_voteName)))
            ) {
                return true;
            }
        }
        return false;
    }

    function isAddressVoted(
        string memory _voteName
    ) internal view returns (bool) {
        Vote storage vote = voteInfo[_voteName];
        for (uint i = 0; i < vote.voterAddress.length; i++) {
            if (vote.voterAddress[i] == msg.sender) {
                return false;
            }
        }
        return true;
    }

    function checkVotedNameList(
        string memory _voteName,
        string memory _votedName
    ) internal view returns (bool) {
        Vote storage vote = voteInfo[_voteName];
        for (uint i = 0; i < vote.votedList.length; i++) {
            if (
                keccak256(bytes(vote.votedList[i])) ==
                (keccak256(bytes(_votedName)))
            ) {
                return true;
            }
        }
        return false;
    }
}
