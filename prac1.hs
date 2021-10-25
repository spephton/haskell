
-- For the simple case, the largest number we'll have to deal with is 18. Start with a digits function only to address this specific case
digits :: Int -> [Int]
digits n
  | n > 10    = 1 : digits (n - 10) -- this function is limited to 2-digit nums < 20
  | otherwise = [n]


-- I was hoping there'd be an elegant way to infer oddness or evenness in the list but I can't find it, so we need a listlen function. Could use the builtin but I'll do it myself as an exercise: 
listLen :: [Int] -> Int
listLen [] = 0
listLen (_:r) = 1 + listLen r
-- Thinking about it, this is a limitation of the data structure. You could pass a calculated or stored length but then you're dealing with a different data structure. 


-- Then, we need to work out how to double every second number in a list from the right
doubleAlternating :: [Int] -> [Int]
doubleAlternating (x:[]) = [x]
--doubleAlternating (x:(y:[])) = [2*x , y]
doubleAlternating (x:r) = (x + x * (((listLen r)) `mod` 2)) : (doubleAlternating r)

listDigits :: [Int] -> [Int]
listDigits (x:[]) = digits x
listDigits (x: r) = (digits x) ++ (listDigits r)

validCCN :: Int -> Bool
validCCN ccn = 0 == sum(listDigits(doubleAlternating(digits(ccn)))) `mod` 10

