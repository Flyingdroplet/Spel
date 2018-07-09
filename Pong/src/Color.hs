
module Color where

import Graphics.UI.GLUT

type GLcolour = (GLfloat, GLfloat, GLfloat)
white, black, blue, red, green, grey, darkgrey :: GLcolour
white = (1,   1,  1)
black = (0,   0,   0)
red   = (1,   0,   0)
green = (0,   1,   0)
blue  = (0.2, 0.2, 1)
grey  = (0.5, 0.5, 0.5)
darkgrey = (0.2, 0.2, 0.2)