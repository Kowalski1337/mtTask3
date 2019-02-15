module Alg where

data Expression = Par Expression | Bin BinaryOp Expression Expression | Var String | Un UnaryOp Expression

data BinaryOp = Minus | Plus | Mul | Div

data UnaryOp = Neg

instance Show UnaryOp where
  show Neg = "-"

instance Show BinaryOp where
  show Minus = " - "
  show Plus = " + "
  show Mul = " * "
  show Div = " / "

instance Show Expression where
  show (Par expr) = "(" ++ (show expr) ++ ")"
  show (Bin op l r) = (show l) ++ (show op) ++ (show r)
  show (Var s) = s
  show (Un op expr) = (show op) ++ (show expr)

--(2+3)*13 - 12/(2+4)
expr :: Expression
expr = Bin Minus (Bin Mul (Par (Bin Plus (Var "2")(Var "3"))) (Var "13")) (Bin Div (Var "12")(Par (Bin Plus (Var "2")(Var "4"))))
