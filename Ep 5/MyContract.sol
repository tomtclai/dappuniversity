pragma solidity ^0.6.0;
contract MyContract {

    
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address public owner;

    constructor() public {
        //whoever deployed the contract
        owner = msg.sender;
    }

    // Conditionals

    function isEvenNumber(uint _number) public pure returns(bool) {
        // 4 / 2 == 2
        // 5 / 2 == 2, remainder 1

        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
    
    // loop

    function countEvenNumbers() public view returns (uint) {
        uint count = 0;
        for (uint i = 0; i < numbers.length; i++) {
            // runs code until condition is not true anymore
            if (isEvenNumber(numbers[i])) {
                count ++;
            }
        }
        return count;
    }


    // conditional with address

    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }
}