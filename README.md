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
git clone https://github.com/your-username/mytoken-contract.git
cd functions_and_errors.sol
```
2. **Compile the Contract**:  
- Open the TradingCardDistributor.sol file in Remix.
- Select Solidity version 0.8.26.
- Compile the contract.
3. **Deploy**:  
- Use any Ethereum development environment or Remix IDE to deploy the contract.

---

