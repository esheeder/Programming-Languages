import Control.Monad
import Data.List

--Given a list of current queens and the row to place the queen, returns lists with all possibilities
--addQueen :: [[Int]] -> Int -> Int -> [[Int]]
addQueen n row list
	| row == 1 = possible
	| otherwise = possible where
		--columns is a list of all columns with a queen already in it
		columns = [ snd a | a <- list ]
		--diagonals is a list of all invalid columns for the current row based on the diagonals of previously placed queens
		diagonals = [ (snd a + row - fst a) | a <- list] ++ [ (snd a - row + fst a) | a <- list]
		--possible is a list of possible placements, which is any column not in the previous lists
		possible = [ (row, x):list | x <- [1..n], (not (x `elem` columns)) && (not (x `elem` diagonals))]

findSolutions solutions row n
	| row > n = solutions
	| otherwise = findSolutions newSolutions (row+1) n
	where
		newSolutions = concat (map (addQueen n row) solutions)

nQueens n
	| length answers == 0 = putStrLn "No solution"
	| otherwise = mapM_ (drawBoard n) answers
	where
		answers = findSolutions (addQueen n 1 []) 2 n
		
nQueensNumSoln n = do
	let answers = findSolutions (addQueen n 1 []) 2 n
	length answers
	
drawBoard n list = do
	let columns = [ snd a | a <- list]
	let board = map (drawLine n) columns
	mapM_ putStrLn board
	putStrLn ""
	
drawLine n column = [ if a == column then 'Q' else 'X' | a <- [1..n] ]