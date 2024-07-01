// SPDX-License-Identifier: MIT

//contracts/ProofOfWork.sol
pragma solidity ^0.8.0;

contract ProofOfWork {
    // Store the last proof
    uint256 public lastProof;

    constructor() {
        // Initialize the first proof
        lastProof = 1;
    }

    // Proof of Work algorithm (simplified)
    function proofOfWork(uint256 nonce) public returns (bool) {
        // Simple hash puzzle: find a nonce such that hash(lastProof + nonce) has 4 leading zeroes
        bytes32 hash = keccak256(abi.encodePacked(lastProof, nonce));
        if (uint256(hash) % 10000 == 0) {
            // Update the last proof
            lastProof = nonce;
            return true;
        } else {
            return false;
        }
    }

    // Helper function to get the hash of the current proof and nonce
    function getHash(uint256 nonce) public view returns (bytes32) {
        return keccak256(abi.encodePacked(lastProof, nonce));
    }
}
