//SPDX-License-Identifier: MIT

//Any thing in the 6 range language version
pragma solidity ^0.6.0;

//importing a contract from the same directory
import "./SimpleStorage.sol";

//creating one smart contract from another contract
//inheritance in solidity
//inheriting all the function,properties of SimpleStorage smart contract

contract StorageFactory is SimpleStorage{

    // creating SimpleStorage type dynamic array to store all SimpleStorage objects
    SimpleStorage[] public simpleStorageArray;

    //state changing function to create SimpleStorage objects and push them to array
    function createsimpleStorageContract() public {

        //instance 
        SimpleStorage simpleStorage = new SimpleStorage();

        simpleStorageArray.push(simpleStorage);
    }

    //calling the SimpleStorage store() from StorageFactory contract
    function storagefactoryStore(uint _simpleStorageindex, uint _simpleStoragenumber) public {
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageindex]));
        simpleStorage.store(_simpleStoragenumber);

        //refactoring code for simplicity
        // SimpleStorage(address(simpleStorageArray[_simpleStorageindex].store(_simpleStoragenumber);
    }

    //calling the SimpleStorage retrieve() from StorageFactory contract
    function storagefactoryGet(uint _simpleStorageindex) public view returns(uint){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageindex]));
        return simpleStorage.retrieve();

         //refactoring code for simplicity
         //return SimpleStorage(address(simpleStorageArray[_simpleStorageindex].retrieve();
    }

}
