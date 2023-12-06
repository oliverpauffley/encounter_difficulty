module Main where

import           System.Environment

main :: IO ()
main = do
  userInput <- getArgs
  let numbers = map read userInput :: [Integer]
  print $ map toCharacter numbers

data Difficulty = Easy | Medium | Hard | Deadly deriving (Enum, Show)

data Character = Character Difficulty Integer Difficulty Integer Difficulty Integer Difficulty Integer
  deriving (Show)

toCharacter :: Integer -> Character
toCharacter level = case level of
  1  -> Character Easy 25 Medium 50 Hard 75 Deadly 100
  2  -> Character Easy 50 Medium 100 Hard 150 Deadly 200
  3  -> Character Easy 75 Medium 150 Hard 225 Deadly 400
  4  -> Character Easy 125 Medium 250 Hard 375 Deadly 500
  5  -> Character Easy 250 Medium 500 Hard 750 Deadly 1100
  6  -> Character Easy 300 Medium 600 Hard 900 Deadly 1400
  7  -> Character Easy 350 Medium 750 Hard 1100 Deadly 1700
  8  -> Character Easy 450 Medium 900 Hard 1400 Deadly 2100
  9  -> Character Easy 550 Medium 1100 Hard 1600 Deadly 2400
  10 -> Character Easy 600 Medium 1200 Hard 1900 Deadly 2800
  11 -> Character Easy 800 Medium 1600 Hard 2400 Deadly 3600
  12 -> Character Easy 1000 Medium 2000 Hard 3000 Deadly 4500
  13 -> Character Easy 1100 Medium 2200 Hard 3400 Deadly 5100
  14 -> Character Easy 1250 Medium 2500 Hard 3800 Deadly 5700
  15 -> Character Easy 1400 Medium 2800 Hard 4300 Deadly 6400
  16 -> Character Easy 1600 Medium 3200 Hard 4800 Deadly 7200
  17 -> Character Easy 2000 Medium 3900 Hard 5900 Deadly 8800
  18 -> Character Easy 2100 Medium 4200 Hard 6300 Deadly 9500
  19 -> Character Easy 2400 Medium 4900 Hard 7300 Deadly 10900
  20 -> Character Easy 2800 Medium 5700 Hard 8500 Deadly 12700
  _  -> Character Easy 2800 Medium 5700 Hard 8500 Deadly 12700

-- Character Level 	————— Encounter Difficulty —————
--              Easy 	Medium  Hard 	Deadly
-- 1st 	25 	50 	75 	100
-- 2nd 	50 	100 	150 	200
-- 3rd 	75 	150 	225 	400
-- 4th 	125 	250 	375 	500
-- 5th 	250 	500 	750 	1,100
-- 6th 	300 	600 	900 	1,400
-- 7th 	350 	750 	1,100 	1,700
-- 8th 	450 	900 	1,400 	2,100
-- 9th 	550 	1,100 	1,600 	2,400
-- 10th 	600 	1,200 	1,900 	2,800
-- 11th 	800 	1,600 	2,400 	3,600
-- 12th 	1,000 	2,000 	3,000 	4,500
-- 13th 	1,100 	2,200 	3,400 	5,100
-- 14th 	1,250 	2,500 	3,800 	5,700
-- 15th 	1,400 	2,800 	4,300 	6,400
-- 16th 	1,600 	3,200 	4,800 	7,200
-- 17th 	2,000 	3,900 	5,900 	8,800
-- 18th 	2,100 	4,200 	6,300 	9,500
-- 19th 	2,400 	4,900 	7,300 	10,900
-- 20th 	2,800 	5,700 	8,500 	12,700
