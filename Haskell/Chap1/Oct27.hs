convertToOz :: String -> Float -> Float
convertToOz "gallons" x = x * 128
convertToOz "quarts" x = x * 32
convertToOz "pints" x = x * 16
convertToOz "cups" x = x * 8
convertToOz y x = error "Unknown conversion factor"

cookTemp2 :: Int -> String
cookTemp2 x
  | temp <= 350 = "Slow"
  | temp <= 400 = "Medium"
  | temp <= 450 = "Hot"
  | otherwise = "Too fucking hot"
  where temp = x