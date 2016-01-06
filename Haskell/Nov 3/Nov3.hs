module Nov3 where

cube [] = []
cube x = map (^3) x

removeFirst [] = []
removeFirst x = map (tail) x

initials x = filter (`elem` ['A'..'Z']) x

noEven x = map (filter odd) x

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

doubleArea = multThree 2

multThreeF :: Num a => a -> a -> a -> a
multThreeF x y z = x * y * z

tenPctDiscount = multThreeF 0.1

pctDiscount x = multThreeF x

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []
