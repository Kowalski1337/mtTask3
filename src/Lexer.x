{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$letter = [a-zA-Z_]

tokens :-

  $white+                    	 ;
  \(                         	 { \_ -> LeftP }
  \)                         	 { \_ -> RightP }
  \+                         	 { \_ -> PlusT }
  \-                         	 { \_ -> MinusT }
  \*                         	 { \_ -> MulT }
  \/                         	 { \_ -> DivT }
  \^                             { \_ -> XorT}
  \%                         	 { \_ -> EucDivT }
  \+=                          { \_ -> PlusEqT }
  \-=                          { \_ -> SubEqT }
  \*=                          { \_ -> MulEqT }
  \/=                          { \_ -> DivEqT }
  \%=                          { \_ -> EucDivEqT }
  >>=                          { \_ -> RShiftEqT }
  \<\<=                        { \_ -> LShiftEqT }
  &=                           { \_ -> AndEqT }
  \|=                          { \_ -> OrEqT }
  ^=                           { \_ -> XorEqT }
  \~                           { \_ -> InvT }
  \|                           { \_ -> OrT }
  &                            { \_ -> AndT }
  >>                           { \_ -> RShiftT }
  \<\<                         { \_ -> LShiftT }
  !                            { \_ -> NotT }
  &&                           { \_ -> AndAndT }
  \|\|                         { \_ -> OrOrT }
  ==                           { \_ -> EqT }
  !=                           { \_ -> NotEqT }
  >                            { \_ -> GTT }
  \<                           { \_ -> LTT }
  >=                           { \_ -> GTET }
  \<=                          { \_ -> LTET }
  true                         { \_ -> TrueT }
  false                        { \_ -> FalseT }
  for                          { \_ -> ForT }
  if                           { \_ -> IfT }
  while                        { \_ -> WhileT }
  return                       { \_ -> ReturnT }
  \;                           { \_ -> SemiT }
  \,                           { \_ -> CommaT }
  \#include                     { \_ -> IncludeT}
  =                            { \_ -> AsT }
  else                         { \_ -> ElseT }
  [$letter][$letter$digit]*    { \s -> Identifier s }
  \{                           { \_ -> LParT }
  \}                           { \_ -> RParT }
  :                            { \_ -> ColonT }
  \"                           { \_ -> QuotesT }
  0|[1-9][$digit]*               { \s -> Number s }

{

data Token = PlusT
           | MulT
           | EucDivT
           | DivT
           | PlusEqT
           | SubEqT
           | MulEqT
           | DivEqT
           | EucDivEqT
           | RShiftEqT
           | LShiftEqT
           | AndEqT
           | OrEqT
           | XorEqT
           | PPT
           | MMT
           | QuotesT
           | InvT
           | OrT
           | AndT
           | RShiftT
           | LShiftT
           | NotT
           | AndAndT
           | MinusT
           | OrOrT
           | EqT
           | NotEqT
           | GTT
           | LTT
           | GTET
           | LTET
           | TrueT
           | FalseT
           | ForT
           | WhileT
           | IfT
           | ElseT
           | ReturnT
           | SemiT
           | CommaT
           | IncludeT
           | AsT
           | LParT
           | RParT
           | LeftP
           | RightP
           | ColonT
           | XorT
           | Number String
           | Identifier String
           deriving (Show, Eq)

}
