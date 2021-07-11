pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract {

    mapping(bytes32 => uint256) private proofs;

    // FIXME emit a message instead
    bool public exists = false;
    uint256 public when;

    event SetPurpose(address sender, address friend, bool isFriend);

    function check(string memory document) public returns (bool) {
        bytes32 proof = getHash(document);
        // Do not complete if not found
        require(exists = search(proof), "NOT FOUND");
        when = proofs[proof];
        //emit ("Proof was resgistered at:");
        emit SetPurpose(msg.sender, msg.sender, true);
        return exists;
    }

    function record(string memory document) public {
        emit SetPurpose(msg.sender, msg.sender, true);
        // Do not register a if already registered
        bytes32 proof = getHash(document);
        require(proofs[proof] == 0, "ALREADY REGISTERD");
        proofs[proof] = block.timestamp;
        //emit ("Proof exists as of now: ");
    }

    function getHash(string memory document) private returns (bytes32) {
        return sha256(abi.encode(document));
    }

    function search(bytes32 proof) private returns (bool) {
        return proofs[proof] != 0;
    }

}
