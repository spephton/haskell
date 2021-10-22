
-- For the simple case, the largest number we'll have to deal with is 18. Start with a digits function only to address this specific case
digits :: Int -> [Int]
digits n
  | n > 10    = 1 : digits (n - 10)
  | otherwise = [n]