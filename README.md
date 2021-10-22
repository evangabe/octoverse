# Octoverse
Solidity smart contracts for Octoverse decentralized play-to-earn game.

### Currency: __seaouid__ Token
> **1 bunch** of __seaouid__ will be equivalent to 0.002 ETH.

### Octopus Game (derived from Gganbu in Netflix's "Squid Game")
Setup:
   Two octopuss owners purchase 20 bunches of seaouid each before the game can begin.
    
   The player with the highest octopuss rarity score chooses **shell** or **belly** for the crab (coin) toss.
      - The crab is then tossed into the air with equal likelihood of landing on its **belly** or **shell**.
      - If the player's guess is correct, that player can choose to **guess** or **put** first.
   
### Objective:
A player wins if they stash a total of __40__ seaouid bunches before time runs out. 
If __15 minutes__ have elapsed before __40__ bunches have been collected by a single player, the player with more bunches is awarded the difference between both players' stashes.
    
### Rules:
1.  The **wagerer** decides how many bunches from their stash will be sacrificed or gained by winning the Round.
2.  Simultaneously, the **putter** chooses a number of bunches to hold in their tentacles
    - In any given turn, the **putter** can **put** 1 to 8 bunches, where each bunch will be held in a different tentacle.
3.  Once the **wagerer**'s bet and **putter**'s put are in, the Round begins and the **wagerer** will have 30 seconds to submit a **guess**.
    - (__First round__) Game timer starts at the beginning of Round 1. The timer ends after __15 minutes__ have elapsed.
4.  A **guess** can be either ***even*** or ***odd*** in reference to the number of bunches the **wagerer** believes the **putter** to have **put** in their tentacles. (Regardless of the **put** amount, all 8 tentacles of the **putter** remain curled such that the **wagerer** will not be able to tell the **put** amount)
    - If the guess is correct, the **wagerer** keeps his betted bunches and also takes that __same amount__ from the **putter**.
    - If the guess is incorrect, the **wagerer** forfeits his betted bunches to the **putter**.
    - If no guess has been made before the timer ends, the **wagerer** forfeits __half__ of his betted bunches to the **putter**.
5. The game repeats, alternating the **wagerer** and **putter** roles after each round, until the ***Objective*** has been reached.
6. Winning player will receive 20 seaouid bunches from the losing player.


## Repository Architecture:
```
octoverse
  > contracts 
    > ./Octopusses.sol
    > ./Seaouid.sol
    > ./OctopusGame.sol
  > scripts
    > ./octoverseWeb3js.js
```

