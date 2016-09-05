elPos :: Eq t => t -> [t] -> Int
elPos x (y:ys)
 |x==y = 0
 |otherwise = 1 + elPos x ys
 
 

