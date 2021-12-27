pragma solidity ^0.6.0;

contract Ownable {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

}

contract SecretVault {
    string secret;

    // constructor is run once and only once 
    constructor(string memory _secret) public {
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyContract is Ownable{ // inheritance

    address secretVault; // composition

    // constructor is run once and only once 
    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    // only owner can call this function
    function getSecret() public view onlyOwner returns(string memory){
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
}