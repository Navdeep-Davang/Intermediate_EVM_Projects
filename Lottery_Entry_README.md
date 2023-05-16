# Lottery Entry Contract

This is the code Solidity contract with use case of reqiure, assert and revert functions in solidity. This Solidity program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve idea of how intermidiate solidity applications are created and how it works.

## Description

The contract named "Lottery" is then defined. It has four variables, one mapping and one function defined as follows:

1) Entry_address: an array of type address that will hold the addresses of participants in the lottery.
2) ticketPrice: a uint variable representing the price of a ticket in wei, which is equal to 50 USDC converted to wei (10^18).
3) maxEntries: a uint variable representing the maximum number of entries allowed in the lottery, which is set to 100.
4) entryClosed: a bool variable representing whether the entry period for the lottery is closed or not.

5) entryExists: This maps addresses to a boolean value indicating whether the address has already entered the lottery or not.

6) enterLottery: This function takes three arguments 'age', 'ticket_price_USDC', and 'entry_addr'.


## Getting Started

### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (eg Lottery_Entry_Contract.sol).

```javascript
pragma solidity ^0.8.4;

contract Lottery {
/* code */
}
```
First we define version of solidity we want to use(i.e. 0.8.4). After that we created a contract named Lottery.

```javascript
// array and public variables here
    address[] Entry_address;
    uint public ticketPrice = 50 * 10 ** 18;
    uint public maxEntries = 100;
    bool public entryClosed = false;
    
```
In this Lottery contract we declared one array which takes address(Entry_address) and three public variabels (ticketPrice, maxEntries, entryClosed) by their type(eg. address, int, bool) and accessibility(eg. public).

```javascript
 // mapping variable here
   mapping(address => bool) public entryExists;
   mapping(address => uint) public entryFund;
 ```   
After that we created mapping of address to boolian value(returns Either Ture or False) and mapping of address to ticket value with which user enters. 

After that we define a function enterlottery with three input parameters 'age', 'ticket_price_USDC', and 'entry_addr'. This function is of type 'payable' means it can receive payments. 
```javascript
function enterLottery(uint age, uint ticket_price_USDC, address entry_addr) public payable {}
 ``` 
 
 In the enterLottery function we use 'assert' funtion' to check whether user entering the lottery has enough funds for ticket. We pass the condition wheather the user has balance greater than ticketPrice. If the codition is true our code is processed futher otherwise it is terminated. This will save us gas as further code is not executed.
 ```javascript
 assert(entry_addr.balance > ticketPrice);     // make sure the person entering the lottery has enough funds for a ticket
 ```

After this we use 'required' function to check whether the age of individual is 18 or above. First paramerter in 'required' is the condition which need to be satisfied for further code to proceed. If the condition is not satisfied then program is terminated and second parameter is thrown in the output. 
 ```javascript
 require(age >= 18, "You must be at least 18 years old to enter the lottery");      // check user age 
```

Similarly we check that entered price is greater than ticketPrice and user is not entered the lottery before.
 ```javascript
 require(ticket_price_wei >= ticketPrice, "You must send atleast 50 USDC to enter the lottery");
 require(!entryExists[msg.sender], "You have already entered the lottery");      // check if the user has already entered
```

Also we check whether we have reached maximum limit of enties or not, using 'revert' function. Unlike required and assert function, we use 'if' to pass our condition and if the condition is true only then we revert required output.
```javascript
   if (Entry_address.length == maxEntries)       // check if the maximum number of entries has been reached
        {
            revert ("Lottery entry is closed");
        }
```

If all conditions are satisfied and there isn't an issue, we push uesrs address in our 'Entry_address' array and pass boolian value in entryExists mapping eqaul to true. This will indicate that user has already entered the lottery. We update another mapping i.e.entryFund which will be useful to use in our Lottery_Status_Contract solidity project.
```javascript
   Entry_address.push(entry_addr);        // add the user to the list of Entry_address
   entryExists[entry_addr] = true;        // mark the user as having entered
   entryFund[entry_addr] = ticket_price_USDC;      // mark the user to ticket value with which he has entered
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Lottery_Entry_Contract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Mytoken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, user can interact with its functions.


## Authors

Navdeep Davang  


## License
This project is licensed under the MIT License


