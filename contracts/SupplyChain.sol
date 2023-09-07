// contracts/SupplyChain.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SupplyChain {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    struct Product {
        string name;
        uint256 price;
        address seller;
    }

    Product[] public products;

    event ProductAdded(string name, uint256 price, address seller);

    function addProduct(string memory _name, uint256 _price) public {
        require(msg.sender == owner, "Only the owner can add products");
        Product memory newProduct = Product({
            name: _name,
            price: _price,
            seller: msg.sender
        });
        products.push(newProduct);
        emit ProductAdded(_name, _price, msg.sender);
    }

    function getProduct(uint256 _index) public view returns (string memory, uint256, address) {
        require(_index < products.length, "Product index out of bounds");
        Product storage product = products[_index];
        return (product.name, product.price, product.seller);
    }

    function getProductsCount() public view returns (uint256) {
        return products.length;
    }
}
