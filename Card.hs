--  File     : Card.hs
--  Author   : Peter Schachte
--  Purpose  : An implementation of a playing card type

-- | This code implements a playing card type, including types for
--   ranks and suits.  All three types are in the Eq, Ord, Bounded,
--   Enum, Show, and Read classes.  Note that we use a compact
--   format for showing and reading ranks and suits:  one character
--   each for rank and suit.

module Card (Suit(..), Rank(..), Card(..)) where

import Data.List

-- | A playing card suit.  Suits are ordered alphabetically, in the 
--   standard order used for Bridge.

data Suit = Club | Diamond | Heart | Spade
          deriving (Eq, Ord, Bounded, Enum)

suitchars = "CDHS"

-- | A playing card rank.  Ranks are ordered 2 - 10, followed by 
--   Jack, Queen, King and Ace.

data Rank =
        R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 |
        Jack | Queen | King | Ace
        deriving (Eq, Ord, Bounded, Enum)

rankchars = "23456789TJQKA"

-- | A standard western playing card.  Jokers are not supported.  
--   Cards are not in the Ord class, but for convenience they are in 
--   Bounded and Enum, to make it convenient to enumerate all the 
--   cards in a deck.  Cards are enumerated with all clubs first, 
--   then diamonds, hearts, and spades, and each suit is enumerated 
--   from lowest to highest rank.

data Card = Card {suit::Suit, rank::Rank}
          deriving (Eq, Bounded)

instance Ord Card where
    compare (Card s1 r1) (Card s2 r2) =
        let suitorder = compare s1 s2
        in  if suitorder == EQ then compare r1 r2 else suitorder

instance Enum Card where
    fromEnum (Card s r) = (fromEnum s)*13 + (fromEnum r)
    toEnum n = (Card s r)
      where s = toEnum (n `div` 13)
            r = toEnum (n `mod` 13)

instance Show Rank where
    show r = [rankchars !! fromEnum r]

instance Show Suit where
    show r = [suitchars !! fromEnum r]

instance Show Card where
    show (Card s r) = show r ++ show s

instance Read Rank where
    readsPrec _ = readSingleCharEnum rankchars

instance Read Suit where
    readsPrec _ = readSingleCharEnum suitchars

readSingleCharEnum :: Enum e => String -> String -> [(e,String)]
readSingleCharEnum str (c:cs) =
    case elemIndex c str of
        Nothing -> []
        Just i -> [(toEnum i, cs)]

instance Read Card where
    readsPrec _ string = 
        [(Card s r,rest) | (r,rest0) <- reads string,
                           (s,rest)  <- reads rest0]

mapRank = map rank
mapSuit = map suit

corCard::[Card] -> [Card]->Int
corCard t g = length (filter (==True) (map (\x-> elem x t) g))

lowRank::[Card] -> [Card]->Int
lowRank t g = length(filter (< minimum b) a)
  where a = mapRank t
        b = mapRank g

corRank::[Card] -> [Card]->Int
corRank t g = minimum [length (filter (==True) (map (\x-> elem x a) b) ),length (filter (==True) (map (\x-> elem x b) a))]
  where a = mapRank t
        b = mapRank g

highRank::[Card] -> [Card]->Int
highRank t g = length (filter (> maximum b) a)
  where  a = mapRank t
         b = mapRank g

corSuit::[Card] -> [Card]->Int
corSuit t g = minimum [length (filter (==True) (map (\x-> elem x c) d) ),length (filter (==True) (map (\x-> elem x d) c))]
  where
        c = mapSuit t
        d = mapSuit g

feedback :: [Card] -> [Card] -> (Int,Int,Int,Int,Int)
feedback t g =(corCard t g,lowRank t g,corRank t g,highRank t g,corSuit t g)


combs :: Int -> [a] -> [[a]]
combs 0 _ = [[]]
combs _ [] = []
combs n (x:xs) = (map (x:) (combs (n-1) xs)) ++ (combs n xs)

feedbackMap:: [Card] -> [[Card]] -> [(Int,Int,Int,Int,Int)]
feedbackMap cards lst = map (\x-> feedback x cards) lst

squareSum (x:xs) = sum(map (\x->x*x) (x:xs))
