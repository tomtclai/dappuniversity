pragma solidity ^0.6.0;

contract HotelRoom {

    // hotel rooms can be vacant or occupied. need to keep track 
    // Enums
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;
    // Modifiers
    modifier onlyWhileVacant {
        // Check status
        require(currentStatus == Statuses.Vacant, "Occupied");
        _; // execute function body
    }

    modifier costs(uint _amount) {
        // Check price
        require(msg.value >= _amount, "Not enough ether provided");
        _;
    }
    // Visibilities

    // Events
    event Occupy(address _occupant, uint _value);
    

    address payable public owner; // state variable, written to the blockchain

    constructor() public {
        owner = msg.sender; // message sender == whoever called constructor == whoever deployed the contract
        currentStatus = Statuses.Vacant;
    }

    receive() external payable onlyWhileVacant costs(2 ether) {
        // user pay smart contract owner to book hotel room
        // Ether - Pay Smart contracts
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); // transfer ethereum to owner
        emit Occupy(msg.sender, msg.value); // emit event
    } 
}