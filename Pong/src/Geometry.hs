module Geometry where
 
import Graphics.UI.GLUT
import Color
import Control.Monad

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

raster :: (GLfloat, GLfloat, GLfloat) -> Bounds -> IO ()
raster c@(r, g, b) bounds =
  renderPrimitive Lines $ do
    let
      x' = maxWidth  bounds
      y' = maxHeight bounds
      x = fromIntegral x'
      y = fromIntegral y'
      xs = [1..(x'-1)]
      ys = [1..(y'-1)]

    color3f r g b
    forM_ (xs) $ (\k -> do drawVerLine x k)
    forM_ (ys) $ (\k -> do drawHorLine y k)

drawVerLine :: GLfloat -> Int -> IO ()
drawVerLine x w' = do
  let
    w = fromIntegral w'
  vertex2f ((1/x)*w, 0)
  vertex2f ((1/x)*w, (-1))

drawHorLine :: GLfloat -> Int -> IO ()
drawHorLine y w' = do
  let
    w = fromIntegral w'
  vertex2f (0, (-1/y)*w)
  vertex2f (1, (-1/y)*w)
