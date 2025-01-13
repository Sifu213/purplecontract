// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/access/Ownable.sol";


contract Nft1knads is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    // Événement émis lors du minting
    event NFTMinted(address indexed recipient, uint256 tokenId);

    constructor() ERC721("Nft1knads", "N1KND") Ownable() {
        tokenCounter = 0;
    }

    /**
     * @dev Fonction pour minter un nouveau NFT.
     * @param recipient Adresse du destinataire du NFT.
     * @return Le nouvel ID du token minté.
     */
    function mintNFT(address recipient) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, "ipfs://bafkreibu45npne5plcqxds7g4ye77kjvvvdky4wtmijmilh5mqcj3hxx6y");
        tokenCounter += 1;

        // Émettre l'événement
        emit NFTMinted(recipient, newTokenId);

        return newTokenId;
    }
}

