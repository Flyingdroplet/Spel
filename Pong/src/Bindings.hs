module Bindings (idle, display, reshape, keyboardMouse) where
 
import Graphics.UI.GLUT
import Display
import Data.IORef
import Color

reshape :: ReshapeCallback
reshape size = do
  viewport $= (Position 0 0, size)
  postRedisplay Nothing

keyboardMouse :: KeyboardMouseCallback
--keyboardMouse key Down _ _ = game $~! processKeyboardCallback key
keyboardMouse _ _ _ _ = return ()