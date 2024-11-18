// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract TradingCardDistributor {
    address public contractOwner;
    uint256 public cardCounter;

    struct Card {
        uint256 id;
        string name;
        uint256 price; 
        address owner;
    }

    mapping(uint256 => Card) private cardCollection;

    event CardMinted(uint256 cardId, string name, uint256 price); 
    event CardPurchased(uint256 cardId, address newOwner);
    event FundsWithdrawn(address indexed recipient, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Access denied: Only the owner can perform this action.");
        _;
    }

    constructor() {
        contractOwner = msg.sender;
    }

    // Mint a new trading card with a specified price
    function mintCard(string calldata name, uint256 price) external onlyOwner {
        require(price > 0, "Error: Price must be greater than 0.");

        cardCounter++;
        cardCollection[cardCounter] = Card({
            id: cardCounter,
            name: name,
            price: price, 
            owner: address(0) 
        });

        emit CardMinted(cardCounter, name, price);
    }

    // Purchase a trading card
    function purchaseCard(uint256 cardId) external payable {
        require(cardId > 0 && cardId <= cardCounter, "Error: Invalid card ID.");
        Card storage card = cardCollection[cardId];
        require(card.owner == address(0), "Error: This card is already owned.");
        require(msg.value == card.price, "Error: Exact card price required.");

        card.owner = msg.sender;

        emit CardPurchased(cardId, msg.sender);
    }

    // Withdraw funds from the contract
    function withdrawFunds() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds available for withdrawal.");

        (bool success, ) = payable(contractOwner).call{value: balance}("");
        require(success, "Error: Withdrawal failed.");

        emit FundsWithdrawn(contractOwner, balance);
    }

    // View card details
    function getCardDetails(uint256 cardId) external view returns (uint256, string memory, uint256, address) {
        require(cardId > 0 && cardId <= cardCounter, "Error: Card ID does not exist.");
        Card memory card = cardCollection[cardId];
        return (card.id, card.name, card.price, card.owner);
    }
}
