// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    //errors
    error MoodNft_CantFlipMoodIfNotOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;
    mapping(uint256 => Mood) private s_tokeIdToMood;

    enum Mood {
        HAPPY,
        SAD
    }

    constructor(
        string memory sadSvgImageUri,
        string memory happySvgImageUri
    ) ERC721("MoodNft", "MN") {
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    function flipMood(uint256 tokenId) public {
        //only want the nft owner able to change it
        if (!_isAuthorized(_ownerOf(tokenId), msg.sender, tokenId))
            revert MoodNft_CantFlipMoodIfNotOwner();
        if (s_tokeIdToMood[tokenId] == Mood.HAPPY)
            s_tokeIdToMood[tokenId] = Mood.SAD;
        else s_tokeIdToMood[tokenId] = Mood.HAPPY;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokeIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokeIdToMood[tokenId] == Mood.HAPPY)
            imageURI = s_happySvgImageUri;
        else imageURI = s_sadSvgImageUri;

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked( //alternative to string.concat
                                '{"name": "',
                                name(),
                                '", "description": "An NFT that reflects the owners mood", "attributes": [{"trait_type": "moodiness", "value": 100}, {"trait_type": "color", "value": "100"}], "image":"',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }
}
