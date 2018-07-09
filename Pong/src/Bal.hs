module Bal where

data Bal = Bal {bounds :: IntPair, coor :: IntPair, speed :: Float, direction :: Float}
type IntPair = (Int, Int)

drawBal :: Bal -> IO()


speedup :: Bal -> Float -> Bal

move :: Bal -> Bal
move bal = bal {coor = newcoor}
  where
    newcoor = (x + (cos direction)*speed, y + (sin direction)speed)
    (_, (x, y), speed, direction) = bal

