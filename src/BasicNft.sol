// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//this basic nft is a collection of birds fall under AB (angry bird) token
contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    //name, symbol
    constructor() ERC721("Bird", "AB") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        // return "ipfs:QmQhL19WEZNhvZwVf77U2MGFKUbpzsmEdsSCE4AQwYQ3sG";
        return s_tokenIdToUri[tokenId];
    }
}
