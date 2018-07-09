module Bal where

data Bal = Bal {bounds :: FloatPair, coor :: FloatPair, speed :: Float, direction :: Float} deriving Show
type FloatPair = (Float, Float)

drawBal :: Bal -> IO()
drawBal = undefined


speedup :: Bal -> Float -> Bal
speedup bal dv = bal {speed = newspeed}
  where
    newspeed = speed bal+dv 
    


move :: Bal -> Bal
move bal = bal {coor = newcoor}
  where
    newcoor = (x + (cos direction')*speed, y + (sin direction')*speed)
    Bal _ (x, y) speed direction' = bal

