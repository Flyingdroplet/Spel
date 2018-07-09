module Display (idle, display, timer) where
 
--import System.Random (getStdGen, StdGen, newStdGen)
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Geometry
import Color

color3f r g b = color $ Color3 r g (b :: GLfloat)
vertex2f x y = vertex $ Vertex2 x (y :: GLfloat)

display :: IORef Game -> DisplayCallback
display game' = do
  clear [ColorBuffer]
  loadIdentity
  square red (0.2,0.2) (0.6,0.6)
  swapBuffers

idle :: IdleCallback
idle = do
  postRedisplay Nothing

timer :: TimerCallback
timer gen game = do
  postRedisplay Nothing