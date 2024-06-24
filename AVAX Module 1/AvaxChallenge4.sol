// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GlobalVar {
    // Store the details of the last transaction
    address public lastSender;
    uint256 public lastValue;
    uint256 public lastTimestamp;
    address public lastCoinbase;
    address public lastOrigin;

    // Event to log the details of the transaction
    event TransactionDetails(
        address indexed sender,
        uint256 value,
        uint256 timestamp,
        address coinbase,
        address origin
    );

    // Function to log transaction details
    function logTransaction() public payable {
        lastSender = msg.sender;
        lastValue = msg.value;
        lastTimestamp = block.timestamp;
        lastCoinbase = block.coinbase;
        lastOrigin = tx.origin;

        // Emit the transaction details
        emit TransactionDetails(
            msg.sender,
            msg.value,
            block.timestamp,
            block.coinbase,
            tx.origin
        );
    }

    // Function to retrieve the last transaction details
    function getLastTransactionDetails()
        public
        view
        returns (
            address,
            uint256,
            uint256,
            address,
            address
        )
    {
        return (lastSender, lastValue, lastTimestamp, lastCoinbase, lastOrigin);
    }
}
