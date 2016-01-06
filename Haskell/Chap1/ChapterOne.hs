module ChapterOne where

negsInList x = sum [1 | a <- x, (a <= -1)]

oddsInList x = sum [1 | a <- x, (a `mod` 2 == 1)]

capsInList x = sum [1 | a <- x, elem a ['A'..'Z']]

sumOdd x = sum [a | a <- x, odd a]

receipt = [(3, 4), (5, 6)]

getQuantities x = [ fst a | a <- x ]

getPrices x = [ snd a | a <- x ]

--zipWith learned from here: http://stackoverflow.com/questions/819434/multiply-two-lists-element-by-element-in-haskell
getTotal x = sum (zipWith (*) (getQuantities x) (getPrices x))

doubleAll x = [[b * 2 | b <- a] | a <- x]

doubleFirstList x = [ 2 * a | a <- (x !! 0)]

doubleSecondList x = [ 2 * a | a <- (x !! 1)]

sumListItems x = [sum([b | b <- a]) | a <- x]