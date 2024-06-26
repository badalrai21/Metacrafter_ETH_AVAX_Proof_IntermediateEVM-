// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Proxy {
    address public implementation;
    address public admin;

    constructor(address _implementation) {
        implementation = _implementation;
        admin = msg.sender;
    }

    modifier adminOnly {
        require(msg.sender == admin, "Only admin can call.");
        _;
    }

    function upgrade(address _newImplementation) external adminOnly {
        implementation = _newImplementation;
    }

    fallback() external payable {
        require(implementation != address(0), "Implementation address must be set.");
        (bool success, ) = implementation.delegatecall(abi.encodePacked(msg.data)); 
        require(success, "Delegatecall failed.");
    }

    receive() external payable {
        revert("Fallback function is not payable right now.");
    }
}

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }

    function getCount() external view returns (uint) {
        return count;
    }
}
