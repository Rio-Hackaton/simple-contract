# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Properties.ts
```
Deployed Addresses
```
0x5FbDB2315678afecb367f032d93F642f64180aa3
```

Abi
```json
  "abi": [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "getPropertiesByOwner",
      "outputs": [
        {
          "components": [
            {
              "internalType": "string",
              "name": "id",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "latitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "longitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "cpf",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "price",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "purchaseDate",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bathrooms",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "suites",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bedrooms",
              "type": "string"
            }
          ],
          "internalType": "struct RealEstateRegistry.Property[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getPropertiesLastMonth",
      "outputs": [
        {
          "components": [
            {
              "internalType": "string",
              "name": "id",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "latitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "longitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "cpf",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "price",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "purchaseDate",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bathrooms",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "suites",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bedrooms",
              "type": "string"
            }
          ],
          "internalType": "struct RealEstateRegistry.Property[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "string",
          "name": "propertyId",
          "type": "string"
        }
      ],
      "name": "getPropertyDetails",
      "outputs": [
        {
          "components": [
            {
              "internalType": "string",
              "name": "id",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "latitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "longitude",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "cpf",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "price",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "purchaseDate",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bathrooms",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "suites",
              "type": "string"
            },
            {
              "internalType": "string",
              "name": "bedrooms",
              "type": "string"
            }
          ],
          "internalType": "struct RealEstateRegistry.Property",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "string",
          "name": "latitude",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "longitude",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "cpf",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "price",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "bathrooms",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "suites",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "bedrooms",
          "type": "string"
        }
      ],
      "name": "registerProperty",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]
```