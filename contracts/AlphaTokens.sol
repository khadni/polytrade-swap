// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AlphaTokens is ERC20 {
    constructor() ERC20("AlphaTokens", "ATK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}