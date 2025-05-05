// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 1) On importe ERC721URIStorage au lieu de ERC721
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.2/contracts/utils/Strings.sol";

contract M2048 is ERC721URIStorage, Ownable {
    using Strings for uint256;

    uint256 public tokenCounter;
    mapping(uint256 => uint256) public tokenScores;

    event NFTMinted(address indexed recipient, uint256 tokenId, uint256 score);

    constructor() ERC721("2048 Monad", "M2048") {
        tokenCounter = 0;
    }

    /**
     * @dev Minte un nouveau NFT avec un score associé.
     * @param recipient L'adresse qui recevra le NFT.
     * @param _score    Le score à stocker on-chain.
     * @return Le tokenId nouvellement minté.
     */
    function mintNFT(address recipient, uint256 _score) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        tokenScores[newTokenId] = _score;

        // Safe mint + setTokenURI sont disponibles ici
        _safeMint(recipient, newTokenId);
        _setTokenURI(
            newTokenId,
            "ipfs://bafkreicomeowzrtokodkt2m3bygezqrnjesceixb7rrxfrea3m7z7tpjge"
        );

        // On incrémente UNE seule fois
        tokenCounter += 1;

        emit NFTMinted(recipient, newTokenId, _score);
        return newTokenId;
    }
}
