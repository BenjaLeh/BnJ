eNth :: Int -> [t] -> [t]
eNth i js 
 |i<=length js  = js !! (i-1) : eNth i (drop i js)
 |otherwise= []