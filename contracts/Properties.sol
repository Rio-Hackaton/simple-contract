// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealEstateRegistry {
    struct Property {
        string id;
        string latitude;
        string longitude;
        string cpf;
        string price;
        string purchaseDate;
        string bathrooms;
        string suites;
        string bedrooms;
    }

    uint private nextId = 1;
    mapping(string => Property) private properties;
    mapping(address => string[]) private ownerProperties;

    // Cadastrar imóvel
    function registerProperty(
        string memory latitude,
        string memory longitude,
        string memory cpf,
        string memory price,
        string memory bathrooms,
        string memory suites,
        string memory bedrooms
    ) public {
        string memory propertyId = uintToString(nextId);
        properties[propertyId] = Property({
            id: propertyId,
            latitude: latitude,
            longitude: longitude,
            cpf: cpf,
            price: price,
            purchaseDate: uintToString(block.timestamp),
            bathrooms: bathrooms,
            suites: suites,
            bedrooms: bedrooms
        });
        ownerProperties[msg.sender].push(propertyId);
        nextId++;
    }

    // Pegar todos imóveis de uma wallet (retorna dados completos dos imóveis)
    function getPropertiesByOwner(address owner) public view returns (Property[] memory) {
        require(owner != address(0), "Invalid address");

        string[] memory propertyIds = ownerProperties[owner];
        Property[] memory ownerPropertiesList = new Property[](propertyIds.length);

        for (uint i = 0; i < propertyIds.length; i++) {
            ownerPropertiesList[i] = properties[propertyIds[i]];
        }

        return ownerPropertiesList;
    }

    // Pegar detalhes do imóvel pelo id
    function getPropertyDetails(string memory propertyId) public view returns (Property memory) {
        return properties[propertyId];
    }

    // Pegar todos os imóveis registrados no último mês
    function getPropertiesLastMonth() public view returns (Property[] memory) {
        uint count = 0;
        uint oneMonthAgo = block.timestamp - 30 days;
        for (uint i = 1; i < nextId; i++) {
            if (stringToUint(properties[uintToString(i)].purchaseDate) >= oneMonthAgo) {
                count++;
            }
        }

        Property[] memory recentProperties = new Property[](count);
        uint index = 0;
        for (uint i = 1; i < nextId; i++) {
            if (stringToUint(properties[uintToString(i)].purchaseDate) >= oneMonthAgo) {
                recentProperties[index] = properties[uintToString(i)];
                index++;
            }
        }
        
        return recentProperties;
    }

    // Função auxiliar para converter uint para string
    function uintToString(uint _value) private pure returns (string memory) {
        if (_value == 0) {
            return "0";
        }
        uint temp = _value;
        uint digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (_value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + _value % 10));
            _value /= 10;
        }
        return string(buffer);
    }

    // Função auxiliar para converter string para uint
    function stringToUint(string memory s) private pure returns (uint) {
        bytes memory b = bytes(s);
        uint result = 0;
        for (uint i = 0; i < b.length; i++) {
            if (b[i] >= bytes1(uint8(48)) && b[i] <= bytes1(uint8(57))) {
                result = result * 10 + (uint8(b[i]) - 48);
            }
        }
        return result;
    }
}
