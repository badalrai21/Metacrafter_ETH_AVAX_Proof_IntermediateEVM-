// SPDX-License-Identifier: MIT
pragma solidity >=0.8.7;

contract Calculator {
    uint256 private storedNumber;

    // A function to set a number, not a view or pure function since it changes the state
    function setNumber(uint256 _number) public {
        storedNumber = _number;
    }

    // A view function to get the stored number, does not modify the state
    function getNumber() public view returns (uint256) {
        return storedNumber;
    }

    // A pure function to add two numbers, does not read or modify the state
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // A pure function to subtract two numbers, does not read or modify the state
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    // A pure function to multiply two numbers, does not read or modify the state
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // A pure function to divide two numbers, does not read or modify the state
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Division by zero");
        return a / b;
    }
}
