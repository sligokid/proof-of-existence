pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LandRegistry is Ownable {

    mapping(bytes32 => uint256) private proofs;

    event UpdateEventWindow(address sender, string message);

    constructor(address _owner) public {
        transferOwnership(_owner);
        console.log("Smart Contract Wallet is owned by:",_owner);
    }

    function verifyTitle(string memory title) public returns (bool) {
        bytes32 proof = getHash(title);
        // Do not complete if not found
        require(search(proof), "NOT FOUND");
        //when = proofs[proof];
        //emit ("Proof was resgistered at:");
        emit UpdateEventWindow(msg.sender, "title exists");
        return true;
    }

    function registerTitle(string memory title) public onlyOwner {
        //require(msg.sender==owner,"NOT THE OWNER!");
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
