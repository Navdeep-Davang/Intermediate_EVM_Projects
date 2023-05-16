// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Lottery_Entry_Contract.sol";

contract Lottery_Status is Lottery {

    function Userfund_wei () public view returns (uint) {

        require(entryExists[msg.sender], "You have not entered in Lottery" );
        uint ticket_price_USDC = entryFund[msg.sender];
        uint ticket_price_wei= ticket_price_USDC * 10 ** 18;
        return ticket_price_wei;
    }
    
    function withdrawLotteryFunds() public payable {
        require(entryExists[msg.sender], "You have not entered the lottery");
        require(entryFund[msg.sender] > 0, "You have already withdrawn your funds");
        
        uint withdrawAmount = entryFund[msg.sender] * (99) * 10 ** 16;
        entryFund[msg.sender] = 0;
        payable(msg.sender).transfer(withdrawAmount);
    }
}
