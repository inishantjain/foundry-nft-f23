// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {MintBasicNft} from "../script/Interactions.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract InteractionsTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address BOB = makeAddr("bob");

    function setUp() external {
        DeployBasicNft deployBasicNft = new DeployBasicNft();
        basicNft = deployBasicNft.run();
    }

    // function testMint() public {
    //     MintBasicNFT mintBasicNFT = new MintBasicNFT();
    //     vm.prank(BOB);
    //     mintBasicNFT.run();
    // }
}
