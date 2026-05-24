

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;


import { AccessControl } from "@openzeppelin/contracts/access/AccessControl.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Chocolate is ERC20, AccessControl {
    bytes32 public constant COOCKER_ROLE = keccak256("COOCKER_ROLE");
    bytes32 public constant EATER_ROLE = keccak256("EATER_ROLE");

    constructor(address _coocker, address _eater) ERC20("Chocolate", "CHOCOLATE") {
        _grantRole(COOCKER_ROLE, _coocker);
        _grantRole(EATER_ROLE, _eater);
				// _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function cook(address _to, uint256 _amount) public onlyRole(COOCKER_ROLE) {
        _mint(_to, _amount);
    }

    function eat(address _from, uint256 _amount) public onlyRole(EATER_ROLE) {
        _burn(_from, _amount);
    }
}