// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    //default initialisation to 0
    uint256  public favoriteNumber;

    //struct object
    struct People{
        //variables are indexed
        uint256 favoriteNumber;
        string name;
    }
    
    People public person1 = People ({favoriteNumber:4,name:"sayantan the billionaire"});
    People public person2 = People({favoriteNumber:7,name:"sayantan the competitor of elon musk"});

    //dynamic array ,view only
    People[] public people;

    //mapping data structure , key-value pair
    mapping(string => uint256) public nameToFavouritenumber;

    // writing function
    //state change
    function store ( uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    //view,pure  function doesn't cost gas , pure for math 
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    //function to add person in dynamic array
    //state change hence orange button
    function addPerson(uint256 _favoriteNumber, string memory _name) public{
        people.push(People({favoriteNumber : _favoriteNumber, name : _name}));
        //adding entry to mapping data structure
        nameToFavouritenumber[_name]= _favoriteNumber;
    }
}
