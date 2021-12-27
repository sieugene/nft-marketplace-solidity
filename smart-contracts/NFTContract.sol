pragma solidity ^0.8.0;

// Import ERC1155 token contract from Openzeppelin
import "../node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

// Remix imports
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFTContract is ERC1155, Ownable {
    constructor(
        uint256 tokenId,
        uint256 amount,
        string memory uri
    ) ERC1155(uri) {
        _mint(msg.sender, tokenId, amount, "");
    }

    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) public onlyOwner {
        _mint(to, id, amount, "");
    }

    function burn(
        address from,
        uint256 id,
        uint256 amount
    ) public {
        require(msg.sender == from);
        _burn(from, id, amount);
    }
}
