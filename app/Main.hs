{-# LANGUAGE InstanceSigs #-}
module Main where

import           System.Environment

main :: IO ()
main = do
  userInput <- getArgs
  let numbers = map read userInput :: [Integer]
  print $ foldr (addCharacters . toCharacter) (Character 0 0 0 0 ) numbers

data Character = Character
  { easy   :: Integer
  , medium :: Integer
  , hard   :: Integer
  , deadly :: Integer
  }

instance Show Character where
  show :: Character -> String
  show (Character a b c d) =
    "Easy: " ++ show a ++
    " Medium: " ++ show b ++
    " Hard: " ++ show c ++
    " Deadly: " ++ show d

toCharacter :: Integer -> Character
toCharacter level = case level of
  1  -> Character  25 50 75 100
  2  -> Character  50 100 150 200
  3  -> Character  75 150 225 400
  4  -> Character  125 250 375 500
  5  -> Character  250 500 750 1100
  6  -> Character  300 600 900 1400
  7  -> Character  350 750 1100 1700
  8  -> Character  450 900 1400 2100
  9  -> Character  550 1100 1600 2400
  10 -> Character  600 1200 1900 2800
  11 -> Character  800 1600 2400 3600
  12 -> Character  1000 2000 3000 4500
  13 -> Character  1100 2200 3400 5100
  14 -> Character  1250 2500 3800 5700
  15 -> Character  1400 2800 4300 6400
  16 -> Character  1600 3200 4800 7200
  17 -> Character  2000 3900 5900 8800
  18 -> Character  2100 4200 6300 9500
  19 -> Character  2400 4900 7300 10900
  20 -> Character  2800 5700 8500 12700
  _  -> Character  2800 5700 8500 12700

addCharacters :: Character -> Character -> Character
addCharacters
  (Character a b c d) (Character a1 b1 c1 d1) = Character (a + a1) (b + b1) (c + c1) (d + d1)
