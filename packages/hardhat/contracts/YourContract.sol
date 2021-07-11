pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract {

    mapping(bytes32 => uint256) private proofs;

    event SetPurpose(address sender, string message);

    function checkForExistance(string memory document) public returns (bool) {
        bytes32 proof = getHash(document);
        // Do not complete if not found
        require(search(proof), "NOT FOUND");
        //when = proofs[proof];
        //emit ("Proof was resgistered at:");
        emit SetPurpose(msg.sender, "document exists");
        return true;
    }

    function recordExistance(string memory document) public {
        // FIXME only the Registrar can register a title
        // Do not register a if already registered
        bytes32 proof = getHash(document);
        require(proofs[proof] == 0, "ALREADY REGISTERED");
        proofs[proof] = block.timestamp;
        emit SetPurpose(msg.sender, "has registered document");
    }

    function getHash(string memory document) private returns (bytes32) {
        return sha256(abi.encode(document));
    }

    function search(bytes32 proof) private returns (bool) {
        return proofs[proof] != 0;
    }

}
