// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {Test, console2} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftIntegrationTest is Test {
    MoodNft moodNft;
    string public constant SAD_SVG_URI =
        "data:application/json;base64,eyJuYW1lIjogIk1vb2ROZnQiLCAiZGVzY3JpcHRpb24iOiAiQW4gTkZUIHRoYXQgcmVmbGVjdHMgdGhlIG93bmVycyBtb29kIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogIm1vb2RpbmVzcyIsICJ2YWx1ZSI6IDEwMH0sIHsidHJhaXRfdHlwZSI6ICJjb2xvciIsICJ2YWx1ZSI6ICIxMDAifV0sICJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU9EQXdJaUJvWldsbmFIUTlJamd3TUNJZ2RtbGxkMEp2ZUQwaU1DQXdJRE0ySURNMklpQjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlHRnlhV0V0YUdsa1pHVnVQU0owY25WbElpQnliMnhsUFNKcGJXY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXUlpUV2xrSUcxbFpYUWlQanhqYVhKamJHVWdabWxzYkQwaUkwWkdRekV3UlNJZ1kzZzlJakU0SWlCamVUMGlNVGdpSUhJOUlqRTRJajQ4TDJOcGNtTnNaVDQ4Y0dGMGFDQm1hV3hzUFNJak5qWTBOVEF3SWlCa1BTSk5NalV1TkRnMUlESTNMak0zT1VNeU5TNDBOQ0F5Tnk0eUlESTBMak14TnlBeU15QXhPQ0F5TTJNdE5pNHpNVGdnTUMwM0xqUTBJRFF1TWkwM0xqUTROU0EwTGpNM09XRXVORGs1TGpRNU9TQXdJREFnTUNBdU1qTTNMalUxTkdFdU5UQTFMalV3TlNBd0lEQWdNQ0F1TmkwdU1EYzNRekV4TGpNM01TQXlOeTQ0TXpjZ01UTXVNekEySURJMklERTRJREkyY3pZdU5qTWdNUzQ0TXpjZ05pNDJORGdnTVM0NE5UVmhMalV3TWk0MU1ESWdNQ0F3SURBZ0xqVTVPQzR3T0RGaExqVXVOU0F3SURBZ01DQXVNak01TFM0MU5UZDZJajQ4TDNCaGRHZytQR1ZzYkdsd2MyVWdabWxzYkQwaUl6WTJORFV3TUNJZ1kzZzlJakV5SWlCamVUMGlNVE11TlNJZ2NuZzlJakl1TlNJZ2NuazlJak11TlNJK1BDOWxiR3hwY0hObFBqeGxiR3hwY0hObElHWnBiR3c5SWlNMk5qUTFNREFpSUdONFBTSXlOQ0lnWTNrOUlqRXpMalVpSUhKNFBTSXlMalVpSUhKNVBTSXpMalVpUGp3dlpXeHNhWEJ6WlQ0OEwzTjJaejQ9In0=";
    address USER = makeAddr("user");

    DeployMoodNft deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenUriIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console2.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToSad() public {
        vm.prank(USER);
        moodNft.mintNft();

        vm.prank(USER);
        moodNft.flipMood(0);

        //assertEq() prints to the console
        assertEq(
            keccak256(abi.encodePacked(moodNft.tokenURI(0))),
            keccak256(abi.encodePacked(SAD_SVG_URI))
        );
    }
}
