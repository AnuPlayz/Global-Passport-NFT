// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AttestationStation is ERC721Enumerable, Ownable {
    struct Visit {
        string location;
        uint256 timestamp;
    }

    mapping(uint256 => Visit[]) private visits;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    // Mint a new NFT as a passport
    function mintPassport(address recipient) external onlyOwner {
        uint256 tokenId = totalSupply() + 1;
        _mint(recipient, tokenId);
    }

    function addVisit(uint256 tokenId, string memory location) external {
        require(_exists(tokenId), "Token does not exist");
        visits[tokenId].push(Visit(location, block.timestamp));
    }

    function removeVisit(uint256 tokenId, uint256 visitIndex) external {
        require(_exists(tokenId), "Token does not exist");
        require(visitIndex < visits[tokenId].length, "Visit index out of bounds");

        uint256 lastIndex = visits[tokenId].length - 1;
        if (visitIndex != lastIndex) {
            visits[tokenId][visitIndex] = visits[tokenId][lastIndex];
        }
        visits[tokenId].pop();
    }

    // Get the number of visits for a specific token
    function getVisitCount(uint256 tokenId) external view returns (uint256) {
        require(_exists(tokenId), "Token does not exist");
        return visits[tokenId].length;
    }

    // Get visit details for a specific token and visit index
    function getVisit(uint256 tokenId, uint256 visitIndex) external view returns (string memory, uint256) {
        require(_exists(tokenId), "Token does not exist");
        require(visitIndex < visits[tokenId].length, "Visit index out of bounds");
        Visit memory visit = visits[tokenId][visitIndex];
        return (visit.location, visit.timestamp);
    }
}