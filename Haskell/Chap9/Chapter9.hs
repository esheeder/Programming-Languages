import qualified Data.Text as DT
import qualified Data.Char as DC
import Control.Monad

pigLatin (x:xs)
	| x `elem` ['A', 'a', 'E', 'e', 'I', 'i', 'O', 'o', 'U', 'u'] = (x:xs) ++ "way"
	| otherwise = xs ++ [x] ++ "ay"

piggly = interact (unwords . map pigLatin . words)

caesar seed character
	| (DC.ord character) + seed <= (DC.ord 'z') && character `elem` ['a'..'z'] = DC.chr (DC.ord character + seed)
	| (DC.ord character) + seed > (DC.ord 'z') && character `elem` ['a'..'z'] = DC.chr (DC.ord character + seed - 26)
	| (DC.ord character) + seed <= (DC.ord 'Z') && character `elem` ['A'..'Z'] = DC.chr (DC.ord character + seed)
	| (DC.ord character) + seed > (DC.ord 'Z') && character `elem` ['A'..'Z'] = DC.chr (DC.ord character + seed - 26)
	| otherwise = character

caesarWord seed word = [caesar seed x | x <- word]

encrypt seed = do
	input <- getLine
	let output = (unwords (map (caesarWord seed) (words input)))
	putStrLn output

encryptFile seed = do
	toEncrypt <- readFile "encryptMe.txt"
	let output = (unlines (map (caesarWord seed) (lines toEncrypt)))
	putStrLn output