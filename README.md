
Decentralized Identity Verification Smart Contract
This smart contract allows for the creation of a decentralized identity verification platform on the Ethereum blockchain. It allows for a designated verifier address to verify the identities of users using smart contract functionality.

Features
Verification of user's identity by a designated verifier
Store the proof of identity
Check identity verification status
revoke verification status
emit events on verification and revocation
Usage
To use the contract, you will need to deploy it on the Ethereum blockchain using a tool such as Remix. Once deployed, the contract owner can set the verifier address using the constructor() function.

The verifier can then verify the identity of users by calling the verifyIdentity() function and passing in a bytes32 argument as a proof of identity. The contract will track the verified users and store the proof of identity. An IdentityVerified event will be emitted.

Users can check their identity verification status using the checkIdentity() function, which returns a tuple of a boolean indicating if the user is verified and bytes32 of the proof of identity.

The verifier can revoke a user's identity verification by calling the revokeIdentity() function. This will emit the IdentityRevoked event and change the user's verification status to false.
