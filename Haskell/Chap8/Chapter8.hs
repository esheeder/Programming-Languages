import qualified Data.Text as DT
import Control.Monad

greeting = do
	putStrLn "Enter your name as last, first"
	name <- getLine
	let names = DT.splitOn (DT.pack ", ") (DT.pack name)
	let firstName = DT.unpack (last names)
	let lastName = DT.unpack (head names)
	putStrLn ("Hello " ++ firstName)
	putStrLn ("Do you have any relatives named Joe " ++ lastName ++ "?")

reverseMe = do
	line <- getLine
	if null line
		then return()
		else do
			let list = words line
			let backwardsList = reverse list
			let backwardsLine = unwords backwardsList
			putStrLn backwardsLine
			
sayHi = do
	putStrLn "What is your name?"
	name <- getLine
	when (name == "Bilbo") $ do
		putStrLn "So nice to meet you!"
	putStrLn "What's up?"

calcArea length width = length*width

calcAreas x y = zipWith (calcArea) x y

printAreas x y = do
	mapM_ print (calcAreas x y)

printDirection dir
	| dir == 'u' = "UP"
	| dir == 'l' = "LEFT"
	| dir == 'r' = "RIGHT"
	| dir == 'd' = "DOWN"
	
printDirections x = do
	forM_ x $ \var -> do
	let dir = printDirection var
	putStrLn ("You should go " ++ dir)