module SpelMain
    ( spelMain
    ) where

import Graphics.UI.GLUT
import Data.IORef
import Bindings
import Color
import Geometry

spelMain :: IO ()
spelMain = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "Hello World"
  reshapeCallback $= Just reshape
  keyboardMouseCallback $= Just (keyboardMouse)
  displayCallback $= display
  idleCallback $= Just idle
  windowSize $= Size 800 400
  --fullScreen
  mainLoop
 

