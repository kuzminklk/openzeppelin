

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { AccessManaged } from "@openzeppelin/contracts/access/manager/AccessManaged.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Berries is ERC20, AccessManaged {
    constructor(address forester) ERC20("Berries", "Berries") AccessManaged(forester) {}

    /* Minting is restricted according to the manager (forester) rules for this function.
    The function is identified by its selector.
    Calculated with bytes4(keccak256('mint(address,uint256)')) */
    function pick(address to, uint256 amount) public restricted {
        _mint(to, amount);
    }
}