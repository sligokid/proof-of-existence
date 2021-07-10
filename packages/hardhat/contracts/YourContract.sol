pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

//import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  mapping (bytes32 => bool) private proofs;

  // FIXME emit a message instead
  bool public exists = false;

  function check(string memory document) public returns (bool) {
    bytes32 proof = getHash(document);
    exists = search(proof);
    return exists;
  }

  function record(string memory document) public {
    bytes32 proof = getHash(document);
    proofs[proof] = true;
  }

  function getHash(string memory document) private returns (bytes32) {
    return sha256(abi.encode(document));
  }

  function search(bytes32 proof) private returns(bool) {
    return proofs[proof];
  }

}
