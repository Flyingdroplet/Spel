module Geometry where
 
import Graphics.UI.GLUT
import Color
import Control.Monad


circle :: Int -> (GLfloat, GLfloat, GLfloat) -> (GLfloat, GLfloat) -> (GLfloat, GLfloat) -> IO ()
circle sides c@(r,g,b) (x1, y1) (x2, y2) = do
  renderPrimitive Polygon $ do
    color3f r g b
    mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
      where
        myPoints :: [(GLfloat,GLfloat,GLfloat)]
        myPoints = [ (((((sin (2*pi*k/(fromIntegral sides)))/2)+1)*width)-width/2+x1, (((((cos (2*pi*k/(fromIntegral sides))))/2)+1)*height)-height/2+y1, 0) | k <- [1..12] ]
        width  = abs (x2-x1)
        height = abs(y2-y1)

vertex2f :: (GLfloat, GLfloat) -> IO ()
vertex2f (x, y) = vertex $ Vertex2 x y

color3f r g b = color $ Color3 r g (b :: GLfloat)

square ::  (GLfloat, GLfloat, GLfloat) -> (GLfloat, GLfloat) -> (GLfloat, GLfloat) -> IO ()
square c@(r, g, b) p1@(x1, y1) p2@(x2, y2) = 
  renderPrimitive Quads $ do
    color3f r g b
    vertex2f (x1, y1)
    vertex2f (x1, y2)
    vertex2f (x2, y2)
    vertex2f (x2, y1)

border :: GLcolour -> GLfloat -> (GLfloat, GLfloat) -> (GLfloat, GLfloat) -> IO ()
border color w (x1, y1) (x2, y2) = do
  square color (x1, y1+w) (x2, y1)   --Top
  square color (x1, y2)   (x2, y2-w) --Bottom
  square color (x1-w, y1) (x1, y2)   --Left
  square color (x2, y1)   (x2+w, y2) --Right

  triangle color (x2, y1) (x2, y1+w) (x2+w, y1) --TopRight
  triangle color (x1, y2) (x1, y2-w) (x1-w, y2) -- BottomLeft
  triangle color (x1, y1) (x1-w, y1) (x1, y1+w) -- TopLeft
  triangle color (x2, y2) (x2+w, y2) (x2, y2-w) -- BottomRight

triangle ::  (GLfloat, GLfloat, GLfloat) -> (GLfloat, GLfloat) -> (GLfloat, GLfloat) -> (GLfloat, GLfloat) -> IO ()
triangle c@(r, g, b) p1@(x1, y1) p2@(x2, y2) p3@(x3, y3) = 
  renderPrimitive Triangles $ do
    color3f r g b
    vertex2f (x1, y1)
    vertex2f (x2, y2)
    vertex2f (x3, y3)

net :: IO ()
net = renderPrimitive Lines $ do
  vertex2f (100, 0)
  vertex2f (100, 100)
