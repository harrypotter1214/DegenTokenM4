// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    string public ERC20_store;
    string public EmptyAccount_rules;

    constructor() ERC20("Degen", "DGN") {
        ERC20_store = "This store has the following items: 1. ERC20 Pen(1 token) 2. ERC20 NFT(5 token) 3. ERC20 Coin(10 token) ";
        EmptyAccount_rules = "Enter 1 to remove all tokens from account";     
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 burn_amt) public override {
        require(balanceOf(msg.sender) >= burn_amt, "Insufficient Balance");
        _burn(msg.sender, burn_amt);
    }

    function store(uint256 iteam) public  {
        if (balanceOf(msg.sender) <= 10) {
            revert("Insufficient Balance");
        }
        if(iteam == 1){
            _burn(msg.sender,  1);
        }
        else if(iteam == 2){
            _burn(msg.sender,  5);
        }
        else if(iteam == 3){
            _burn(msg.sender,  10);
        }
        else{
            revert("Invalid input");
        }
        
    }

    function EmptyAccount(uint256 YesOrNo) public  {
        if(YesOrNo == 1)
        _burn(msg.sender, balanceOf(msg.sender));
        
    }
}
