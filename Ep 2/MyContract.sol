pragma solidity ^0.6.0;

contract MyContract {

    // state variable is stored on the blockchain itself

    // couple data types:
    string public myString = "Hello world";
    bytes32 public myBytes32 = "Hello world"; // like string but better performance 

    uint public myUint = 1; // short for uint256
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;
    int public myInt = 1;

    address public myAddress = 0xFFD658170A9b414A9dA897138DF94710787B233a;

    struct MyStruct {
        uint myInt;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello world");


    function getValue() public pure returns(uint) {
        // local
        uint value = 1;
        return value;
    }
}