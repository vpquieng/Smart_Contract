// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleDeliveryOrder {
    address public owner;

    struct Order {
        uint256 id;
        address customer;
        string item;
        uint256 price;
        bool isDelivered;
    }

    uint256 public orderCount;
    mapping(uint256 => Order) public orders;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Function to place an order
    function placeOrder(string memory item) public payable {
        require(msg.value > 0, "Order price must be greater than zero."); // Require a valid payment
        orderCount++;
        orders[orderCount] = Order(orderCount, msg.sender, item, msg.value, false);
    }

    // Function to mark an order as delivered (only owner can do this)
    function deliverOrder(uint256 orderId) public {
        require(msg.sender == owner, "Only owner can mark as delivered."); // Require sender to be the owner
        Order storage order = orders[orderId];
        require(order.id == orderId, "Order does not exist."); // Require valid order ID
        require(!order.isDelivered, "Order already delivered."); // Require the order is not delivered yet
        order.isDelivered = true;

        // Ensure the order is marked as delivered
        assert(order.isDelivered == true); // Assert the internal state change
    }

    // Function to cancel an order and get a refund (only if not delivered)
    function cancelOrder(uint256 orderId) public {
        Order storage order = orders[orderId];
        require(order.id == orderId, "Order does not exist."); // Require a valid order ID
        require(order.customer == msg.sender, "Only the customer can cancel."); // Require sender to be the customer
        require(!order.isDelivered, "Cannot cancel a delivered order."); // Require the order is not yet delivered

        uint256 refundAmount = order.price;
        delete orders[orderId];
        (bool success, ) = payable(msg.sender).call{value: refundAmount}("");
        if (!success) {
            revert("Refund transfer failed."); // Revert if the refund transfer fails
        }
    }
}
