-- rational.hs

--
-- Implement your answers in this file.
--
-- There are few rules to follow:
--
--  - Don't change the MyRational type.
--  - Don't change any of the given function signatures.
--  - Use only functions from the standard prelude. Don't import any Haskell
--    modules.
--
-- You can implement your own helper functions if you like.
--

data MyRational = Frac Integer Integer
--
-- Given integers n and d, create a new rational with n as the numerator and d
-- as the denominator. Trying to create a rational with denominator 0 is an
-- error. Call the error function to crash the function, e.g. error
-- "makeRational: denominator can't be 0"
--

makeRational :: Integer -> Integer -> MyRational
makeRational n d = Frac n d
--
-- Returns the numerator of a rational.
--
getNum :: MyRational -> Integer
getNum (Frac n d) = n
--
-- Returns the denominator of a rational.
--
getDenom :: MyRational -> Integer
getDenom (Frac n d) = d
--

-- Returns a pair of the numerator and denominator of a MyRational.
--
pair :: MyRational -> (Integer, Integer)
pair (Frac n d) = (n,d)

--
-- Implement an instance of the show function that returns the usual string
-- representation of the rational. For instance, 5/3 would be the string
-- "5/3".
--
instance Show MyRational where
    show (Frac n d) = (show n) ++ "/" ++ (show d)

--
-- Convert the fraction to a floating point value Returns the value as the
-- number as a floating point number. For example, 5/2 is 2.5, 1/3 is 0.3333,
-- etc. Hint: use fromIntegral.
--
toFloat :: MyRational -> Float
toFloat (Frac n d) = nf / df
    where nf = fromIntegral n :: Float
          df = fromIntegral d :: Float

--
-- Implement an instance of == that test if two MyRationals are equal. Be
-- careful if either is not in lowest terms!
--
instance Eq MyRational where
    x == y = toFloat x == toFloat y

--
-- Implement an instance of compare x y that tests if the MyRationals x and y
-- are the same (return EQ), or x is less than y (return LT), or x is greater
-- than y (return GT). Be careful with negative values, and when x or y is not
-- in lowest terms!
--
instance Ord MyRational where
    compare x y = toFloat x `compare` toFloat y

--
-- Return True if the given MyRational represents an integer, and False
-- otherwise. For example, 4/1, 21/3, and 0/99 are all integers.
--
isInt :: MyRational -> Bool
-- ...
isInt (Frac n d) = n `mod` d == 0

--
-- Adds two given MyRationals and returns a new MyRational that is there sum.
--
add :: MyRational -> MyRational -> MyRational
-- ...
add (Frac n d) (Frac n2 d2) = let x = n*d2 + d*n2; y= d*d2 in makeRational x y

--
-- Multiplies two given MyRationals and returns a new MyRational that is there
-- product.
--
mult :: MyRational -> MyRational -> MyRational
-- ...
mult (Frac n d) (Frac n2 d2) = let x = n*n2 ; y= d*d2 in makeRational x y

--
-- Divides two given MyRationals and returns a new MyRational that is there
-- quotient. Call the error function if division by zero would occur.
--
divide :: MyRational -> MyRational -> MyRational
-- ...
divide (Frac n d) (Frac n2 d2) = let x = n*d2; y=d*n2 in makeRational x y

--
-- Inverts a given MyRational and returns a new one with the numerator and
-- denominator switched. For example, 2/3 inverts to 3/2. Call the error
-- function for 0 numerators, e.g. 0/3 inverts to 3/0, which is not a
-- rational.
--
invert :: MyRational -> MyRational
-- ...
invert (Frac n d) = makeRational d n

--
-- Reduces a given MyRational and returns a new MyRational that is in lowest
-- terms. For example, 36/20 reduces to 9/5. Use the gcd function to help do
-- this. Be careful in the case where the numerator or denominator is
-- negative.
--
toLowestTerms :: MyRational -> MyRational
-- ...
toLowestTerms (Frac n d) = let a = n `div` val ; b=d `div` val in makeRational a b 
                                where val=gcd n d

--
-- Given an integer, return a rational equal to 1/1 + 1/2 + ... + 1/n.
--
-- For example:
--
-- > harmonicSum 25
-- 34052522467/8923714800
--
harmonicSum :: Integer -> MyRational
-- ...
harmonicSum 1 =  makeRational 1 1
harmonicSum x =  let n= x-1 in add (makeRational 1 x) (harmonicSum n)

--
-- Using insertion sort, list any list of values [a] for a type that
-- implements Ord.
--
-- For example:
--
-- > insertionSort [5,6,2,3,1,4]
-- [1,2,3,4,5,6]
--
-- > insertionSort ["one","two","three","four"]
-- ["four","one","three","two"]
--
-- > insertionSort [makeRational 2 2,makeRational 0 1,
--                  makeRational 4 5,makeRational (-1) 7]
-- [-1/7,0/1,4/5,2/2]
--

insertionSort :: Ord a => [a] -> [a]
-- ...
insertionSort [] = [] 
insertionSort (x:xs) = insert $ insertionSort xs
    where insert [] = [x]
          insert (y:ys) | x < y = x : y : ys | otherwise = y : insert ys



