pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract LandRegistry {

    mapping(bytes32 => uint256) private proofs;

    event UpdateEventWindow(address sender, string message);

    function verifyTitle(string memory title) public returns (bool) {
        bytes32 proof = getHash(title);
        // Do not complete if not found
        require(search(proof), "NOT FOUND");
        //when = proofs[proof];
        //emit ("Proof was resgistered at:");
        emit UpdateEventWindow(msg.sender, "title exists");
        return true;
    }

    function registerTitle(string memory title) public {
        // FIXME only the Registrar can register a title
        // Do not register a if already registered
        bytes32 proof = getHash(title);
        require(proofs[proof] == 0, "ALREADY REGISTERED");
        proofs[proof] = block.timestamp;
        emit UpdateEventWindow(msg.sender, "has registered title");
    }

    function getHash(string memory title) private returns (bytes32) {
        return sha256(abi.encode(title));
    }

    function search(bytes32 proof) private returns (bool) {
        return proofs[proof] != 0;
    }

}
