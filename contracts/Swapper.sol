// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Swapper is ERC20 {
    address payable admin;
    uint256 public AlphaBetaToOmegaPrice;
    mapping (address => bool) public authorizedTokens;

    constructor(address _alphaTokens, address _betaTokens) ERC20("OmegaTokens", "OTK"){
        admin = payable(msg.sender);
        AlphaBetaToOmegaPrice = 1;
        authorizedTokens[_alphaTokens] = true;
        authorizedTokens[_betaTokens] = true;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    function setOmegaPrice(uint256 _newPrice) public onlyAdmin {
        AlphaBetaToOmegaPrice = _newPrice;
    }

    function getOmegaPrice() public view onlyAdmin returns (uint256) {
        return AlphaBetaToOmegaPrice;
    }

    /*
    * Convert an amount of input _token to an equivalent amount of the output token
    *
    * @param _token address of token to swap
    * @param amount amount of token to swap/receive
    */
    function swap(address _token, uint amount) external {
        require(amount > 0, "The amount of sent tokens must be greater than zero.");
        require(authorizedTokens[_token] == true, "You cannot swap this type of token to OmegaTokens");
        require(IERC20(_token).balanceOf(msg.sender) >= amount * 10 ** 18, "The sender does not have enough tokens to swap this amount.");
        bool verifyTransferFrom = IERC20(_token).transferFrom(msg.sender, address(this), amount * 10 ** 18);
        require(verifyTransferFrom, "Tokens not received");
        uint swapAmount = amount * 10 ** 18 * AlphaBetaToOmegaPrice;
        _mint(msg.sender, swapAmount);
    }

    /*
    * Convert an amount of the output token to an equivalent amount of input _token
    *
    * @param _token address of token to receive
    * @param amount amount of token to swap/receive
    */
   function unswap(address _token, uint amount) external {
        require(amount > 0, "The amount of sent tokens must be greater than zero.");
        require(authorizedTokens[_token] == true, "You cannot swap OmegaTokens to this type of token");
        require(balanceOf(msg.sender) >= amount * 10 ** 18, "The sender does not have enough Omega Tokens to swap this amount.");
        uint unswapAmount = amount * 10 ** 18 / AlphaBetaToOmegaPrice;
        bool verifyTransferFrom = IERC20(_token).transferFrom(msg.sender, address(this), amount * 10 ** 18);
        require(verifyTransferFrom, "Tokens not received");
        _burn(msg.sender, unswapAmount);
   }
}