index :: [Char] -> Char -> Int
index [] _ = error "Element not found."
index (a:b) el = if el == a
    then 0
    else 1 + index b el

firstn :: [t] -> Int -> [t] 
firstn [] _ = []
firstn lst 0 = []
firstn (h:t) n = [h] ++ firstn t (n-1)


lastn :: [t] -> Int -> [t]
lastn (a:b) n = if n >= length (a:b)
    then (a:b)
    else lastn b n


main = do
    print "===index==="
    print $ index "abcdefgh" 'c'
    print $ firstn [1,2,3] 1
    print $ lastn [1,2,3] 2
    