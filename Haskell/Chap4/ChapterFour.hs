module ChapterFour where


minimum' [] = error "minimum of empty list"
minimum' [x] = x
minimum' (x:xs)
	| x < minTail = x
	| otherwise = minTail
	where minTail = minimum' xs
	
calcSum [] = 0
calcSum [x] = x
calcSum (x:xs) = x + calcSum xs

count [] = 0
count [x] = 1
count (x:xs) = 1 + count xs

makeRange x y
	| x == y = [x]
	| otherwise = x:(makeRange (x+1) y)

makeReverseRange x y
	| x == y = [x]
	| otherwise = y:(makeReverseRange x (y-1))
	
notInList _ [] = True
notInList x [y]
	| x == y = False
	| otherwise = True
notInList x (y:ys)
	| x == y = False
	| otherwise = notInList x ys
	
square :: Int -> Int
square x = x^2

squareAll [] = []
squareAll (x:xs) = (square x):(squareAll xs)

squareIfEven [] = []
squareIfEven (x:xs)
	| (x `mod` 2) == 0 = (square x):(squareIfEven xs)
	| otherwise = x:(squareIfEven xs)
	
squareOnlyEven [] = []
squareOnlyEven (x:xs)
	| (x `mod` 2) == 0 = (square x):(squareOnlyEven xs)
	| otherwise = (squareOnlyEven xs)

mergeSort [] x = x
mergeSort x [] = x
mergeSort (x:xs) (y:ys)
	| x < y = x:(mergeSort xs (y:ys))
	| otherwise = y:(mergeSort (x:xs) (ys))
	
subList _ _ [] = []
subList x y z
	| y == 0 = []
	| x >= length z = []
	| otherwise = (z!!x):(subList (x+1) (y-1) z)