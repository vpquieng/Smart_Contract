# Trading Card Distributor - Smart Contract  

## Overview  
The **Trading Card Distributor** is a Solidity smart contract designed to facilitate the creation, purchase, and management of trading cards on the Ethereum blockchain. This decentralized system ensures secure transactions, ownership tracking, and transparency for both card creators and buyers.  

---

## Features  
### Core Functionalities  
- **Mint New Cards**: The contract owner can create trading cards with a unique name and price.  
- **Buy Cards**: Users can purchase available cards by paying the specified price in Ether.  
- **Ownership Tracking**: Each card's owner is securely recorded and updated after every purchase.  
- **View Card Details**: Users can check the details of any card, including its name, price, and owner.  

### Administrative Features  
- **Fund Withdrawal**: The contract owner can withdraw all collected Ether.  
- **Owner Access Control**: Only the contract owner can mint cards or withdraw funds.  

---

## Prerequisites  
- Ethereum wallet compatible with Solidity version `0.8.26`.  
- **Test Environment**: Use platforms like [Remix](https://remix.ethereum.org/) or a local Ethereum testnet such as [Ganache](https://trufflesuite.com/ganache/).  
- **Metamask** or any Web3 wallet to test transactions.  

---

## Installation  
### Steps to Deploy  
1. **Clone the Repository**:  
```bash
git clone https://github.com/your-username/Smart_Contract.git
cd functions_and_errors
```
2. **Compile the Contract**:  
- Open the functions_and_errors.sol file in Remix.
- Select Solidity version 0.8.26.
- Compile the contract.
3. **Deploy**:  
- Use any Ethereum development environment or Remix IDE to deploy the contract.

---
## Usage Instructions
### Minting a Card
- **Action**: Call the `mintCard` function.
- **Requirement**: Must be the contract owner.
- **Parameters**:
  - `name`: A string representing the card's name.
  - `price`: The price of the card in Wei (1 Ether = 10^18 Wei).
- **Example**:
```solidity
mintCard("Dragon Slayer", 10000000000000000); // 0.01 Ether
```
- **Result**: A new card is minted, and its details are stored in the contract.
---
### Buying a Card
- **Action**: Call the `purchaseCard` function.
- **Requirement**: The card must be available, and the buyer must send the exact price in Ether.
- **Parameters**:
  - `cardId`: The ID of the card to purchase.
- **Example**:
```solidity
purchaseCard(1, { value: 10000000000000000 }); // 0.01 Ether
```
- **Result**: The card's ownership is transferred to the buyer.
---
### Viewing Card Details
- **Action**: Call the `getCardDetails` function.
- **Parameters**:
  - `cardId`: The ID of the card to view.
- **Example**:
```solidity
getCardDetails(1);
```
- **Result**: Returns the card's ID, name, price, and owner.
---
### Withdrawing Funds
- **Action**: Call the `withdrawFunds` function.
- **Requirement**: Must be the contract owner.
- **Example**:
```solidity
withdrawFunds();
```
- **Result**: All Ether in the contract is transferred to the owner's wallet.
---

### Contract Details
## State Variables
- `contractOwner`: Stores the address of the contract deployer.
- `cardCounter`: Tracks the total number of cards minted.
- `cardCollection`: A mapping to store details of all minted cards by their unique ID.
## Structs
- **Card**: Holds card information such as ID, name, price, and owner.
## Events
- **CardMinted**: Logs the creation of a new card with its ID, name, and price.
- **CardPurchased**: Logs the purchase of a card, including its ID and the new owner.
- **FundsWithdrawn**: Logs Ether withdrawals, specifying the recipient and the amount.
---

### Error Handling
## Require Statements
- **Minting Restrictions**: Only the owner can mint new cards.
- **Exact Payment**: Buyers must send the exact card price in Ether.
- **Valid Card ID**: Functions validate card IDs before proceeding.
- **Ownership Check**: Only unowned cards can be purchased.
Revert Statements
- **Insufficient Funds**: Transactions revert if the payment amount is incorrect.
- **Withdrawal Failures**: Reverts if Ether transfer to the owner fails.
---

### Tests
## Test Cases
- 1. **Minting a Card**: Owner creates a card with valid name and price (pass).
- 2. **Purchasing a Card**: User purchases an available card with exact Ether (pass).
- 3. **Duplicate Purchases**: Attempting to purchase an already owned card (fail).
- 4. **Withdrawing Funds**: Owner withdraws all Ether after purchases (pass).
---

## Contributors
- **Vincent Paul Quieng** - Developer 

## License 
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

