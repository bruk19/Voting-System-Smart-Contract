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

    function createVoteSystem(
        string memory _voteName,
        string[] memory _votedNameList,
        uint _timeDuration
    ) public {
        Vote storage vote = voteInfo[_voteName];

        vote.voteCreater = msg.sender;
        createdVoteList.push(_voteName);
        vote.timeDuration = _timeDuration;

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
}
