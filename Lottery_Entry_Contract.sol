// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Lottery {
    address[] Entry_address;
    uint public ticketPrice = 50 * 10 ** 18;
    uint public maxEntries = 100;
    bool public entryClosed = false;
    
    mapping(address => bool) public entryExists;
    
    function enterLottery(uint age, uint ticket_price_USDC, address entry_addr) public payable {
        assert(entry_addr.balance > ticketPrice);
        require(age >= 18, "You must be at least 18 years old to enter the lottery");
        uint ticket_price_wei= ticket_price_USDC * 10 ** 18;
        require(ticket_price_wei >= ticketPrice, "You must send atleast 50 USDC to enter the lottery");
        
        
          if (Entry_address.length == maxEntries) 
        {
            revert ("Lottery entry is closed");
        }
        require(!entryExists[msg.sender], "You have already entered the lottery");
       
       Entry_address.push(entry_addr);
        entryExists[entry_addr] = true;
        
       
    }
}
