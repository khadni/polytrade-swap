# Simple Swapper Project

This project demonstrates a basic Swapper use case.

The challenge is creating a Solidity smart contract and deploying it on Mumbai. The user should be able to swap either of the two tokens for a single token of their choice. For example, you can swap token A or token B for token C. Swaps should also be possible in the reverse direction. Token C can be exchanged for token A (Alpha Tokens) or token B (Beta Tokens). The exchange rate is 1:1 by default. Input side ERC20 tokens (A and B) do not need to swappable for each other. No method is needed to swap A <=> B.
A || B <==> C

## Token Parameters

Please give each token a unique name and symbol. Do not call them A, B, C tokens. Tokens can all have the same number of decimals.

> The following names and symbols are implemented:
>
> - A: Alpha Tokens (ATK),
> - B: Beta Tokens (BTK),
> - C: Omega Tokens (OTK).

### Token Minting

Tokens A and B should be minted outside of Swapping contract. The Swapping contract should not be able to mint any new A or B tokens. Token C, however, should be minted and burned exclusively from inside the Wrapper contract.

> Both Alpha and Beta Tokens are issued with a 1.000.000 supply.
> Omega Tokens will be minted / burned as needed.

## External resources

Feel free to use any code from OpenZeppelin. You may import their contracts into your own or deploy theirs without modifications. Please refrain from using code from any other source.

> ERC20 and IERC20 from [OpenZeppelin](https://docs.openzeppelin.com/contracts/4.x/erc20) are used.

## Deliverables

1. Repo that contains all the smart contracts (Please follow gitflow)
2. Source code for your deployed Swapping contract, tokens A, B, C, and any other contracts you deploy as part of your solution.
3. The MUMBAI deployment address of each contract delivered in 2.
4. A pseudocode call sequence for the correct order and arguments to deploy all contracts and swap 100 token A for token C, then convert 50 token C to token B.
5. set new Price for token C
6. Swap again with the new price

### Example Call Sequence

1. Deploy all Tokens
2. Deploy Swapping()
3. Swapping.swap(TokenA.address, 100) // 1:1
4. setPriceC(2) // Amount of A || B needed for swapping
5. Swapping.swap(TokenA.address, 100) // You should receive 50 TokenC for 100 TokenA

## Provided Stub

```
contract Swapper {
    /*
    * Convert an amount of input token_ to an equivalent amount of the output token
    *
    * @param token_ address of token to swap
    * @param amount amount of token to swap/receive
    */
    function swap(address token_, uint amount) external {
        // ...
    }
    /*
    * Convert an amount of the output token to an equivalent amount of input token_
    *
    * @param token_ address of token to receive
    * @param amount amount of token to swap/receive
    */
    function unswap(address token_, uint amount) {
        // ...
    }
}
```
