# Proof of Existence (Ethereum)

### Setup
> node version: 
```bash
node -v
v12.16.3
```

> Install project dependencies
```bash
yarn install
```

>Shell 1 - Launch an ethereum test chain (Hardhat) 

```bash
yarn chain
`````

>Shell 2 - Start web client UI and connect to chain (scaffold-eth) 

```bash
yarn start
```

>Shell 3 - Deploy smart contract to chain (Solidity) 
```bash
yarn deploy
```
---
### Smart Registration  
http://localhost:3000/

When the browser loads, you will be introduced to an instance of scaffold-eth that provides you with a wallet and account 
so that you can interact with the Ethereum deployed Land Registry Smart Contract via your account.
- By default your account is the owner of the contract, and assumes the role of the Registrar. 
- Alternative accounts (citizens) can be generated using another browser (incognito).

#### Grab some Gas
Before you begin, you need to fund your account with some gas. Almost all transaction calls incur gas.
- In the top right of your screen select '__Grab funds from the faucet__'

#### Scenarios 
Note: For the following scenarios the 'title' is the string representation of the title data, ie the JSON object for registration.

#### Register a proof 
As a registrar
* enter the title `ATITLE` in the `proofOfExistance` box
* click send
* Registrar is notified by an exception 'this proof is NOT registered'. 

As a registrar
* enter the title `ATITLE` in the `registerExistance` box
* click send
* Everyone is notified his address 'has registered this proof'. 

As a registrar
* enter the title `ATITLE` in the `registerExistance` box
* click send
* Everyone is notified that this proof exists. 

#### Citizen query a proof (Incognito browser)
As a citizen
* enter the title `BTITLE` in the `proofOfExistance` box
* click send
* citizen is notified by an exception 'this proof is NOT registered'. 

As a citizen
* enter the title `ATITLE` in the `proofOfExistance` box
* click send
* Everyone is notified his address 'has registered this proof'. 

### Role Based services
The smart contract is `Ownable` meaning it is owned by the deploying account (Registrar)
- Role: Registrar
    - Only the Registrar can register proofs
    - The Registrar can transfer the ownership of the contract to another address ie another Registrar
    - The Registrar can renounce ownership of the contract meaning it will noo longer accept registrations.
- Role: Citizen
    - The citizen can only request the `proofOfExistance` service. 
    - Access to all other methods is restricted to the owner of the contract.

### Future Improvements 
There is an opportunity to introduce decentralised filestorage for the documnent that the proof represents and then render a link
to that document on proof of existance. A content addressed storage such as IPFS or filecoin would be a good fit. 

It would be better to have IPFS generate the hash of the content off chain, since all calls on chain incur gas.

---
##### Credits
🙏 This project is a fork of scaffold-eth, a rapid feedback etheruem SDK (https://github.com/austintgriffith/scaffold-eth.git)
