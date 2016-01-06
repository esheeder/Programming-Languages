module ChapterFive_Pt1 where

convert input factor = input*factor

doMetersToFeet = convert 3.28084

doMilesToKM = convert 1.60934

calcSalesTax rate price = rate*price

doGolden = calcSalesTax 0.03

doBoulder = calcSalesTax 0.0341

swap (x, y) = (y, x)

swapAll x = map swap x

applyIfTrue f x bool
	| bool == True = f x
	| otherwise = 0

calcArea length width = length*width

calcAreas x y = zipWith (calcArea) x y