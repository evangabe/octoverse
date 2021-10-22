pragma solidity >=0.5.0 <0.6.0;

import "./Ownable.sol";
import "github/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract Seaouid is Ownable {
    using SafeMath for uint256;
    
    mapping(address => uint256) private _balances;
    mapping(address => uint256) private _wagers;
    
    event AddSeaouidEvent(address _owner, uint256 _numBunches);
    event WagerSeaouidEvent(address _owner, uint256 _numBunches);
    
    modifier sufficientFunds(uint256 amt) {
        require(_balances[msg.sender] >= amt, "Insufficient funds for transaction.");
        _;
    }
    
    function _exists(address _owner) internal pure returns(bool) { return _owner != address(0); }
    
    function addSeaouid(uint256 _numBunches) 
        public
        payable
    {
        require(_exists(msg.sender));
        if (_numBunches > 0) {
            _balances[msg.sender] = _balances[msg.sender].add(_numBunches);
            emit AddSeaouidEvent(msg.sender, _numBunches);
        }
    }
    
    function wagerSeaouid(uint256 _wagerBunches) public payable sufficientFunds(_wagerBunches) { _wagers[msg.sender] = _wagers[msg.sender].add(_wagerBunches); }
}
