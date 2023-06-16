I had problems with importing Systemic.Random as a module in this assignment. 
So I found a solution by building it using cabal, and import the module as a seperate files mainly using: x383-haskall.cabal
and src/MyLib.hs . From (https://www.haskell.org/ghcup/steps/)

The rational package can be found in src/MyLib.hs (module used for testing time) and rational.hs
The file app/Main.hs is used for sorting the random lists
The execution time was calculated by running Measure-Command {cabal run} in PowerShell windows

To build this assignment run "cabal build"
To run the executables "cabal run" 
