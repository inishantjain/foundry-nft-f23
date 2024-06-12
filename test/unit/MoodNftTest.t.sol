// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {MoodNft} from "../../src/MoodNft.sol";
import {Test, console2} from "forge-std/Test.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    string public constant HAPPY_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgwMCIgd2lkdGg9IjgwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgNDczIDQ3MyI+PGNpcmNsZSBjeD0iMjM2Ljk2NiIgY3k9IjIzNi45NjYiIHI9IjIzNi45NjYiIGZpbGw9IiNmZmMxMGUiLz48cGF0aCBkPSJNMzkyLjUxOCAyMzcuMTIzYzAgODUuOTE1LTY5LjY1MyAxNTUuNTYtMTU1LjU2NyAxNTUuNTYtODUuOTExIDAtMTU1LjU2LTY5LjY0NS0xNTUuNTYtMTU1LjU2aDMxMS4xMjd6IiBmaWxsPSIjNjY0NTAwIi8+PGcgZmlsbD0iIzY2NDUwMCI+PGNpcmNsZSBjeD0iMTYzIiBjeT0iMTU1IiByPSIzNyIvPjxjaXJjbGUgY3g9IjMwNiIgY3k9IjE1NSIgcj0iMzciLz48L2c+PC9zdmc+";

    string public constant SAD_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAwIiBoZWlnaHQ9IjgwMCIgdmlld0JveD0iMCAwIDM2IDM2IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGFyaWEtaGlkZGVuPSJ0cnVlIiByb2xlPSJpbWciIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPjxjaXJjbGUgZmlsbD0iI0ZGQzEwRSIgY3g9IjE4IiBjeT0iMTgiIHI9IjE4Ij48L2NpcmNsZT48cGF0aCBmaWxsPSIjNjY0NTAwIiBkPSJNMjUuNDg1IDI3LjM3OUMyNS40NCAyNy4yIDI0LjMxNyAyMyAxOCAyM2MtNi4zMTggMC03LjQ0IDQuMi03LjQ4NSA0LjM3OWEuNDk5LjQ5OSAwIDAgMCAuMjM3LjU1NGEuNTA1LjUwNSAwIDAgMCAuNi0uMDc3QzExLjM3MSAyNy44MzcgMTMuMzA2IDI2IDE4IDI2czYuNjMgMS44MzcgNi42NDggMS44NTVhLjUwMi41MDIgMCAwIDAgLjU5OC4wODFhLjUuNSAwIDAgMCAuMjM5LS41NTd6Ij48L3BhdGg+PGVsbGlwc2UgZmlsbD0iIzY2NDUwMCIgY3g9IjEyIiBjeT0iMTMuNSIgcng9IjIuNSIgcnk9IjMuNSI+PC9lbGxpcHNlPjxlbGxpcHNlIGZpbGw9IiM2NjQ1MDAiIGN4PSIyNCIgY3k9IjEzLjUiIHJ4PSIyLjUiIHJ5PSIzLjUiPjwvZWxsaXBzZT48L3N2Zz4=";
    address USER = makeAddr("user");

    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_IMAGE_URI, HAPPY_SVG_IMAGE_URI);
    }

    function testViewTokenUri() public {
        vm.prank(USER);
        moodNft.mintNft();
        console2.log(moodNft.tokenURI(0));
    }
}
