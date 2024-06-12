// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {console2, Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgwMCIgd2lkdGg9IjgwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgNDczIDQ3MyI+PGNpcmNsZSBjeD0iMjM2Ljk2NiIgY3k9IjIzNi45NjYiIHI9IjIzNi45NjYiIGZpbGw9IiNmZmMxMGUiLz48cGF0aCBkPSJNMzkyLjUxOCAyMzcuMTIzYzAgODUuOTE1LTY5LjY1MyAxNTUuNTYtMTU1LjU2NyAxNTUuNTYtODUuOTExIDAtMTU1LjU2LTY5LjY0NS0xNTUuNTYtMTU1LjU2aDMxMS4xMjd6IiBmaWxsPSIjNjY0NTAwIi8+PGcgZmlsbD0iIzY2NDUwMCI+PGNpcmNsZSBjeD0iMTYzIiBjeT0iMTU1IiByPSIzNyIvPjxjaXJjbGUgY3g9IjMwNiIgY3k9IjE1NSIgcj0iMzciLz48L2c+PC9zdmc+";
        string
            memory svg = '<svg height="800" width="800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 473 473"><circle cx="236.966" cy="236.966" r="236.966" fill="#ffc10e"/><path d="M392.518 237.123c0 85.915-69.653 155.56-155.567 155.56-85.911 0-155.56-69.645-155.56-155.56h311.127z" fill="#664500"/><g fill="#664500"><circle cx="163" cy="155" r="37"/><circle cx="306" cy="155" r="37"/></g></svg>';

        string memory actualUri = deployer.svgToImageUri(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
