eB :: Eq a => a -> [a] -> Maybe a
eB p [_]=Nothing
eB p (h:y:ys)
 | y==p = Just h
 | otherwise = eB p (y:ys)