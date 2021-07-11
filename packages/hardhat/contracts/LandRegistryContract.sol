pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LandRegistry is Ownable {

    mapping(bytes32 => uint256) private proofs;

    event UpdateEventWindow(address sender, string message);

    constructor(address _owner) public {
        transferOwnership(_owner);
        console.log("Smart Contract is owned by:", _owner);
    }

    function transferOwnership(address newOwner) public override {
        super.transferOwnership(newOwner);
        emit UpdateEventWindow(newOwner, "is now the Registrar");
    }

    function proofOfExistance(string memory title) public returns (bool) {
        bytes32 proof = getHash(title);
        // Do not complete if not found
        require(search(proof), "This proof is NOT registered");
        //when = proofs[proof];
        //emit ("Proof was resgistered at:");
        emit UpdateEventWindow(msg.sender, "This proof exists");
        return true;
    }

    function registerExistance(string memory title) public onlyOwner {
        bytes32 proof = getHash(title);
        // Do not register a if already registered
        require(proofs[proof] == 0, "This proof is ALREADY registered");
        proofs[proof] = block.timestamp;
        emit UpdateEventWindow(msg.sender, "has registered this proof");
    }

    function getHash(string memory title) private returns (bytes32) {
        return sha256(abi.encode(title));
    }

    function search(bytes32 proof) private returns (bool) {
        return proofs[proof] != 0;
    }

}
