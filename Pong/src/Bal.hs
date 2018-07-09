module Bal where

data Bal = Bal {bounds :: IntPair, coor :: IntPair, speed :: Float, direction :: Float}
type IntPair = (Int, Int)

drawBal :: Bal -> IO()
drawBal = undefined


speedup :: Bal -> Float -> Bal
speedup bal dv = bal {speed = newspeed}
  where
    newspeed = speed bal+dv 
    
	

move :: Bal -> Bal
move bal = bal {coor = newcoor}
  where
    newcoor = (x + (cos direction')*speed, y + (sin direction')speed)
    (_, (x, y), speed, direction') = bal

