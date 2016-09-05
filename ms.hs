ms:: Int->Int->[Int]
ms a b
 | a>b = a:ms (a-1) b
 | a<b = a:ms (a+1) b
 | otherwise = [a]