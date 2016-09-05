appd :: [t] -> [t] -> [t]
appd j js = j++js


rev :: [t]->[t]
rev []= []
rev js= last (js) : rev (take ((length js)-1) js) 

myrev [] =[]
myrev (x:xs)= (myrev xs)++ [x]