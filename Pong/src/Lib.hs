module Lib
    ( someFunc
    ) where


import SpelMain

someFunc :: IO ()
someFunc = do
  putStrLn "starting application"
  spelMain