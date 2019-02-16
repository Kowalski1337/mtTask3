 module Main where

import Grammar
import Lexer (alexScanTokens)
import Parser (parseExpr)

main :: IO ()
main = do
       input <- readFile "input.txt"
       case parseExpr (alexScanTokens input)  of
           Right expr  -> writeFile "output.txt"  (show expr)
           Left parseErr -> writeFile "output.txt" "parse error"
