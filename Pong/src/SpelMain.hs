module SpelMain
    ( spelMain
    ) where

import System.Random
import Graphics.UI.GLUT
import Data.IORef
import Bindings
import Color
import Game
import Geometry

snake1 :: Snake
snake1 = [{-
  (5, 1, No, False),
  (5, 2, No, False),
  (6, 2, We, False),
  (6, 3, No, False),
  (5, 3, Ea, False),
  (4, 3, Ea, False),
  (3, 3, Ea, False),
  (2, 3, Ea, False),
  (2, 2, So, False),
  (2, 1, So, False), -}
  Segment (1, 1) Ea False ,
  Segment (0, 1) Ea False]

field :: PlayingField
field = PlayingField [snake1] (Bounds 10 10) (0,0)

game = Game Game.Menu field

someFunc :: IO ()
someFunc = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "Hello World"
  reshapeCallback $= Just reshape
  game <- newIORef game
  keyboardMouseCallback $= Just (keyboardMouse game)
  displayCallback $= display game
  idleCallback $= Just idle
  gen <- getStdGen
  addTimerCallback 2000 (timer gen game)
  windowSize $= Size 700 700
  --fullScreen
  mainLoop
 

