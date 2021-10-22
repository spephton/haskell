golf :: Integer -> Integer
golf n = n + 1

main :: IO ()
main = putStrLn (show (golf 5)) -- prints "6"