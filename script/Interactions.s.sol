// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {Script} from "forge-std/Script.sol";

import {console2} from "forge-std/Test.sol";

import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant ANGRY_BUBBLE_URI =
        "ipfs://bafybeico4yipth5bdb6ymlatbei5kqr6drghrdndefxuruzzbfswjlnboa/?filename=angry_bubble.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid); //devops tools not working
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(ANGRY_BUBBLE_URI);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}
