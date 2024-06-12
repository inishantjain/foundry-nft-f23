// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address USER = makeAddr("user");
    string public constant ANGRY_BUBBLE =
        "ipfs://bafybeico4yipth5bdb6ymlatbei5kqr6drghrdndefxuruzzbfswjlnboa/?filename=angry_bubble.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Bird";
        string memory actualName = basicNft.name();
        // assertEq(expectedName, actualName); //foundry function (can be used for tests)
        // assert(basicNft.name() == "Bird"); //not possible in solidity
        // we can compare chars using loop as string is arr of chars
        // OR we can hash both strings and compare their hashes
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft(ANGRY_BUBBLE);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(ANGRY_BUBBLE)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
