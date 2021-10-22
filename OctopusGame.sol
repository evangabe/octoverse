pragma solidity >= 0.7.0 <0.9.0;

contract OctopusGame {
    enum GameStates {
        InintializeGame,
        Round,
        GameOver
    }
    
    GameStates gameState = GameStates.InintializeGame;
    
    modifier notOverYet {
        require(gameState != GameStates.GameOver, "No more rounds will take place this game.");
        _;
    }
    
    function _transitionState(GameStates _next) internal {
        gameState = _next;
    }
    
    function initializeGame() public {}
    
    function startRound() public {}
    
    function setWager() public {}
    
    function setPut() public {}
    
    function gameOver() public {}
}
