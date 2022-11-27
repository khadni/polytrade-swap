// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BetaTokens is ERC20 {
    constructor() ERC20("BetaTokens", "BTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}