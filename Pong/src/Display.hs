module Display (idle, display) where
 
--import System.Random (getStdGen, StdGen, newStdGen)
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Geometry
import Color

color3f r g b = color $ Color3 r g (b :: GLfloat)
vertex2f x y = vertex $ Vertex2 x (y :: GLfloat)

display :: DisplayCallback
display = do
  clear [ColorBuffer]
  loadIdentity
  translate $ Vector3 (-1) (-1) (0 :: GLfloat)
  scale 2 2 (1 :: GLfloat)
  scale (1/200) (1/100) (1 :: GLfloat)
  square red (0, 0) (10, 100)
  square green (190, 0) (200, 100)
  circle 12 blue (50,50) (55,55)
  square white (25,60) (27,75)
  square white (173,10) (175,25)
  net
  swapBuffers

idle :: IdleCallback
idle = do
  postRedisplay Nothing
