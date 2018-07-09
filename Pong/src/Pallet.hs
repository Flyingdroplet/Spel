module Pallet where

data Pallet = Pallet {coor:: FloatPair, speed :: Float, height :: Float, witdh:: Float}
type FloatPair = (Float, Float)

drawPallet :: Pallet -> IO()
drawPallet = undefined



move :: Pallet -> Pallet
move pallet = pallet {coor = newcoor}
  where
    (x,y) = coor pallet
    newcoor = (x , y + speed pallet)




















