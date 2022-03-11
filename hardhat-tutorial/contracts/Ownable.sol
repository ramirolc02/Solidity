//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Ownable {
    address payable public owner; // atributo payable necesario para enviarle ether

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner(){
        require(msg.sender == owner, "No es el owner"); // revierte
        _;
    }

    constructor(address payable _owner){
        owner = _owner;
        owner.transfer(10 ether);
    }

    function transferOwnership(address payable newOwner) onlyOwner public{
        address previousOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(previousOwner, newOwner);
    }
}