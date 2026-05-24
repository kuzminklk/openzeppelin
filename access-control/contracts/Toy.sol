
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;


import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";


contract Toy is Ownable {
	constructor () Ownable(msg.sender) {}

	function play() public pure returns (string memory) {
		string memory message = "Playing a toy!";
		return message;
	}
}