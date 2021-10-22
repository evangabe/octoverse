pragma solidity >=0.5.0 <0.6.0;
// SPDX-License-Identifier: UNLICENSED

// Import Declarations
//import "./Seaweed.sol";
import "github/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";
import "./Ownable.sol";
/*
    Octopus:
        - (uint256) id = unique identifier for octopus
        - (uint256) dna = dna representing octopus characteristics
            > head: 10 options
            > eyes: 9 options
            > tentacles: 5 options
            > armor: 30 options
            > necklace: 25 options
            = 337,000 combinations (1 combination will be the default octopus priced at 0.02 ETH)
*/


contract Octopusses is Ownable{
    using SafeMath for uint256;
    using SafeMath for uint8;
    
    uint8 constant MAX_OCTOPUS = 255;
    uint256 constant dnaModulus = 10**16;
    mapping (uint256 => address) public octopusToOwner;
    mapping (address => uint8) public ownerOctopusCount;
    
    event CreateOctopusEvent(address _owner);
    
    struct Octopus {
        string name;
        uint256 dna;
    }
    
    Octopus[] public octopusses;
    
    function _exists(address _owner) internal pure returns(bool) { return _owner != address(0); }
    
    function getOctopussesByOwner() 
        internal
        view
        returns(uint256[] memory)
    {
        uint256[] memory res = new uint256[](ownerOctopusCount[msg.sender]);
        uint256 counter = 0;
        for (uint256 i = 0; i < octopusses.length; i++)
        {
            if (octopusToOwner[i] == msg.sender) {
                res[counter] = i;
                counter.add(1);
            }
        }
        return res;
    }
    
    function createOctopus(string memory _name) 
        internal
    {
        require(ownerOctopusCount[msg.sender] < MAX_OCTOPUS, "You cannot have more than 255 octopusses!");
        uint256 _dna = _generateRandomDna(_name);
        uint256 _id  = octopusses.push(Octopus(_name, _dna)) - 1;
        octopusToOwner[_id] = msg.sender;
        ownerOctopusCount[msg.sender].add(1);
        emit CreateOctopusEvent(msg.sender);
    }
    
    function transferOctopus(address _newOwner, uint256 _id) 
        internal
    {
        require(octopusToOwner[_id] == msg.sender, "You do not own this octopus.");
        require(_exists(_newOwner), "This is the burn address!");
        octopusToOwner[_id] = _newOwner;
        ownerOctopusCount[_newOwner].add(1);
        ownerOctopusCount[msg.sender].sub(1);
    }
    
    function _generateRandomDna(string memory _name) internal pure returns(uint) { return uint(keccak256(abi.encodePacked(_name))) % dnaModulus; }
    
}
