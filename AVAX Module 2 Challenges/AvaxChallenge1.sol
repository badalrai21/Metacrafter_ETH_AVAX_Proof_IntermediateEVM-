// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleMath {
    // State variables (storage)
    uint public lastAdditionResult;
    uint public lastMultiplicationResult;

    // Function to add two numbers and store the result
    function add(uint a, uint b) public returns (uint) {
        uint result = a + b; 
        lastAdditionResult = result; 
        return result; 
    }

    // Function to multiply two numbers and store the result
    function multiply(uint a, uint b) public returns (uint) {
        uint result = a * b; 
        lastMultiplicationResult = result; 
        return result; 
    }

    // Function to add two numbers without storing the result
    function temporaryAdd(uint a, uint b) public pure returns (uint) {
        uint result = a + b; 
        return result;  
    }

    // Function to multiply two numbers without storing the result
    function temporaryMultiply(uint a, uint b) public pure returns (uint) {
        uint result = a * b; 
        return result; 
    }
}
