// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleEther {
    address public owner;

    event Received(address sender, uint256 amount);
    event Withdraw(address to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Fallback function to handle unrecognized calls and receive Ether
    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Function to receive Ether
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
        emit Withdraw(owner, _amount);
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
