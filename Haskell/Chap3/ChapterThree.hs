module ChapterThree where

inList :: Eq a => a -> [a] -> [a]
inList x y = [a | a <- y, (a == x)]

square :: Int -> Int
square x = x^2

squareEvenNumbers :: [Int] -> [Int]
squareEvenNumbers x = [square(a) | a <- x, (a `mod` 2) == 0]

courseMajor :: String -> String
courseMajor all@(x:y:xs) = all ++ " is a " ++ [x] ++ [y] ++ " course"

threshold :: (Ord a, Num a) => a -> a -> a -> [Char]
threshold price qty thresh
	| price * qty < lowthresh = "Total is low"
	| price * qty < medthresh = "Total is medium"
	| price * qty < highthresh = "Total is high"
	| otherwise = "Total is extraordinary"
	where
		lowthresh = thresh
		medthresh = thresh*2
		highthresh = thresh*3
	
lactate :: (Ord a, Fractional a) => a -> a -> [Char]
lactate hr max
	| hr/max >= competitive = "wow, don't do this for long!"
	| hr/max >= anaerobic = "anaerobic"
	| hr/max >= steadyState = "steadyState"
	| hr/max >= aerobic = "aerobic"
	| otherwise = "warmup"
	where
		easy = 0.6
		aerobic = 0.7
		steadyState = 0.8
		anaerobic = 0.9
		competitive = 1

calcAreas :: Num t => [(t, t)] -> [t]
calcAreas x = [area(a) | a <- x]
	where
	area :: Num a => (a, a) -> a
	area x = (fst x)*(snd x)

calcTriangleAreas :: Fractional t => [(t, t)] -> [t]
calcTriangleAreas x = [area(a) | a <- x]
	where
	area :: Fractional a => (a, a) -> a
	area x = (fst x)*(snd x)/2

orderTwo :: Ord a => [a] -> [a]
orderTwo x
	| (x !! 0) < (x !! 1) = x
	| otherwise = [x !! 1, x !! 0]

orderThree x
	| (x !! 0) == minimum x = [x !! 0] ++ orderTwo [x!!1, x!!2]
	| (x !! 1) == minimum x = [x !! 1] ++ orderTwo [x!!0, x!!2]
	| otherwise = [x !! 2] ++ orderTwo [x!!0, x!!1]