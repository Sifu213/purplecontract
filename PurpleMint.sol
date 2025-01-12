// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/access/Ownable.sol";

contract PurpleMint is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    // Mapping pour suivre les adresses qui ont déjà minté
    mapping(address => bool) public hasMinted;

    constructor() ERC721("PurpleMint", "PMNT") Ownable() {
        tokenCounter = 0;
    }

    /**
     * @dev Fonction pour mint un nouveau NFT.
     * @param recipient Adresse du destinataire du NFT.
     * @return Le nouvel ID du token minté.
     */
    function mintNFT(address recipient) public onlyOwner returns (uint256) {
        // Vérifier si l'adresse a déjà minté
        //require(!hasMinted[recipient], "NFT already mint.");

        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, "ipfs://bafkreibu45npne5plcqxds7g4ye77kjvvvdky4wtmijmilh5mqcj3hxx6y");
        tokenCounter += 1;

        // Marquer l'adresse comme ayant minté
        hasMinted[recipient] = true;

        return newTokenId;
    }
}
