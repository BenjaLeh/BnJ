module Assignment1 (elementPosition, everyNth, elementBefore) where

elementPosition :: Eq t => t -> [t] -> Int
elementPosition elm (y:ys)
 |elm == y = 0
 |otherwise = 1 + elementPosition elm (ys)
 
 
everyNth :: Int -> [t] -> [t]
everyNth n (js) 
 |n <= length (js) = (js) !! (n-1) : everyNth n (drop n (js))
 |otherwise= []
 
 
elementBefore :: Eq a => a -> [a] -> Maybe a
elementBefore elm [_]=Nothing
elementBefore elm (h:y:ys)
 |y==elm = Just h
 |h==elm = Nothing
 |otherwise = elementBefore elm (y:ys)
 
 