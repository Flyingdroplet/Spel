module Bindings (idle, display, timer, reshape, keyboardMouse) where
 
import Graphics.UI.GLUT
import Display
import Data.IORef
import Color
import Game

reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)
  postRedisplay Nothing

keyboardMouse :: KeyboardMouseCallback
--keyboardMouse game key Down _ _ = game $~! processKeyboardCallback key
keyboardMouse _ _ _ _ _= return ()