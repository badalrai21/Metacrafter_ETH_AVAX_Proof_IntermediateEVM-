// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Counter {
    uint public count;

    // Define events with indexed parameters
    event Increment(address indexed sender, uint newValue);
    event Decrement(address indexed sender, uint newValue);
    event Reset(address indexed sender, uint oldValue);

    // Increment the counter and emit an event
    function increment() public {
        count += 1;
        emit Increment(msg.sender, count);
    }

    // Decrement the counter and emit an event
    function decrement() public {
        require(count > 0, "Counter: cannot decrement below zero");
        count -= 1;
        emit Decrement(msg.sender, count);
    }

    // Reset the counter and emit an event
    function reset() public {
        uint oldValue = count;
        count = 0;
        emit Reset(msg.sender, oldValue);
    }
}
