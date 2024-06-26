// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract AdminSpecific {
    string private secret;
    uint private level;
    address public admin;

    modifier isAdmin() {
        require(msg.sender == admin, "Only admin can access");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function setSecret(string memory _secret) public isAdmin {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }

    function setLevel(uint _level) public isAdmin {
        level = _level;
    }

    function getLevel() public view returns(uint) {
        return level;
    }
    
    function changeAdmin(address newAdmin) public isAdmin {
        admin = newAdmin;
    }
}
