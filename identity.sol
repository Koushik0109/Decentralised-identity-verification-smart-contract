pragma solidity ^0.8.0;

contract IdentityVerification {
    mapping(address => bool) public verified;
    mapping(address => bytes32) public identityProof;
    address public verifier;
    event IdentityVerified(address user);
    event IdentityRevoked(address user);

    constructor(address _verifier) public {
        verifier = _verifier;
    }

    function verifyIdentity(bytes32 _identityProof) public {
        require(msg.sender == verifier);
        require(!verified[msg.sender]);
        identityProof[msg.sender] = _identityProof;
        verified[msg.sender] = true;
        emit IdentityVerified(msg.sender);
    }

    function revokeIdentity() public {
        require(msg.sender == verifier);
        require(verified[msg.sender]);
        delete identityProof[msg.sender];
        verified[msg.sender] = false;
        emit IdentityRevoked(msg.sender);
    }

    function checkIdentity() public view returns (bool, bytes32) {
        return (verified[msg.sender], identityProof[msg.sender]);
    }
}
