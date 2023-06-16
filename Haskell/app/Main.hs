module Main where

import qualified MyLib (randomList, randomListRationals,randomListString, insertionSort)

main :: IO ()
main = do --result <- MyLib.randomList 10000
          --let a = MyLib.insertionSort result
          --result2 <- MyLib.randomListString 10000
          --let b = MyLib.insertionSort result2
          result3 <- MyLib.randomListRationals 10000
          let c = MyLib.insertionSort result3
          putStrLn(show c)