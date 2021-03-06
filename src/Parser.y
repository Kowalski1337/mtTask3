{
module Parser where

import Grammar
import Lexer
}

%name      parseExpr
%tokentype { Token }
%error     { parseError }
%monad     { Either String }{ >>= }{ return }

%token NUMBER  { Number $$ }
%token IDEN  { Identifier $$ }
%token MINUS   { MinusT }
%token PLUS    { PlusT }
%token LEFTP   { LeftP }
%token MUL { MulT }
%token RIGHTP  { RightP }
%token DIV     { DivT }
%token EUCDIV     { EucDivT }
%token PLUSEQ     { PlusEqT }
%token SUBEQ     { SubEqT }
%token MULEQ     { MulEqT }
%token DIVEQ     { DivEqT }
%token EUCDIVEQ     { EucDivEqT }
%token RSHIFTEQ     { RShiftEqT }
%token LSHIFTEQ     { LShiftEqT }
%token ANDEQ     { AndEqT }
%token OREQ     { OrEqT }
%token XOREQ     { XorEqT }
%token INV     { InvT }
%token OR     { OrT }
%token AND     { AndT }
%token RSHIFT     { RShiftT }
%token LSHIFT     { LShiftT }
%token NOT     { NotT }
%token ANDAND     { AndAndT }
%token OROR     { OrOrT }
%token EQ     { EqT }
%token NOTEQ     { NotEqT }
%token GT     { GTT }
%token LT     { LTT }
%token GTE     { GTET }
%token LTE     { LTET }
%token TRUE     { TrueT }
%token FALSE     { FalseT }
%token FOR     { ForT }
%token IF     { IfT }
%token WHILE     { WhileT }
%token ELSE    { ElseT }
%token RETURN     { ReturnT }
%token SEMI     { SemiT }
%token COMMA     { CommaT }
%token INCLUDE     { IncludeT }
%token AS     { AsT }
%token LPAR     { LParT }
%token RPAR     { RParT }
%token QUOTES     { QuotesT }
%token COLON     { ColonT }
%token XOR { XorT }

%%

Code
  : Single              { Final $1 }
  | Single Code         { Other $1 $2 }

Single
  : Include             { Inc $1 }
  | Function            {Func $1}
  | Variable            { Var $1 }

Include
  : INCLUDE QUOTES IDEN QUOTES  { Quotes $3 }
  | INCLUDE LT IDEN GT          { Brackets $3 }

Variable
  : Type Name SEMI              { Default $1 (WithOutAssig (SingleExpr (VarAtom $2))) }
  | Type Name AS Assig SEMI              { Default $1 (SimpleAssig As $2 $4) }

Type
  : IDEN { SimpleType $1 }

Name
  : IDEN { Name $1 }


    Function
      : Type Name Args Block { Fun $1 $2 $3 $4 }

    Args
      : LEFTP RIGHTP { Zero }
      | LEFTP Type Name RIGHTP { One $2 $3 }
      | LEFTP Type Name COMMA MoreArgs RIGHTP { More $2 $3 $5  }

    MoreArgs
      : Type Name { One $1 $2 }
      | Type Name COMMA MoreArgs { More $1 $2 $4 }

    Block
      : LPAR Internal RPAR { Par $2 }
      | LPAR RPAR {EmptyBlock}

    Internal
      : CodeLine { SinglePart $1 }
      | CodeLine Internal { MultipleLines $1 $2 }

    CodeLine
      : Term    { Assignment $1 }
      | For      { ForLoop $1 }
      | While    { WhileLoop $1}
      | If       { Conditional $1 }
      | Variable { Inits $1 }
      | Block    { Part $1 }
      | Return   { $1 }

    Return
      : RETURN Term { Return $2 }

    If
      : IF LEFTP Assig RIGHTP Block  { StandartIf $3 $5 }
      | IF LEFTP Assig RIGHTP Block ELSE Block { IfElse $3 $5 $7 }

    For
     : FOR LEFTP Term Term RIGHTP Block { Iter $3 $4 EmptyTerm $6 }
     | FOR LEFTP Type Term Term RIGHTP Block { IterType $3 $4 $5 EmptyTerm $7 }
     | FOR LEFTP Type Term Term Assig RIGHTP Block { IterType $3 $4 $5 (NotEmpty $6) $8 }
     | FOR LEFTP Term Term Assig RIGHTP Block { Iter $3 $4 (NotEmpty $5) $7 }
     | FOR LEFTP Name COLON Name RIGHTP Block { ForEach $3 $5 $7}
     | FOR LEFTP Type Name COLON Name RIGHTP Block { ForEachType $3 $4 $6 $8 }

    While
      : WHILE LEFTP Assig RIGHTP Block { StandartWhile $3 $5 }

    Term
      : SEMI { EmptyTerm }
      | Assig SEMI { NotEmpty $1 }

      Assig
        : Name AssigOp Expr14 { SimpleAssig $2 $1 (WithOutAssig $3) }
        | Expr14  { WithOutAssig  $1 }

      AssigOp
        : PLUSEQ { PlusEq }
        | SUBEQ { SubEq }
        | MULEQ { MulEq }
        | DIVEQ { DivEq }
        | EUCDIVEQ { EucDivEq }
        | LSHIFTEQ { LShiftEq }
        | RSHIFTEQ { RShiftEq }
        | OREQ { OrEq }
        | ANDEQ { AndEq }
        | XOREQ { XorEq }
        | AS  { As }

      Expr14
        : Expr13 OROR Expr14 { BinaryExpr Or $1 $3 }
        | Expr13 {$1}

      Expr13
        : Expr12 ANDAND Expr13 { BinaryExpr And $1 $3 }
        | Expr12 {$1}

      Expr12
        : Expr11 OR  Expr12 { BinaryExpr BitOr $1 $3 }
        | Expr11 {$1}

      Expr11
        : Expr10 XOR  Expr11 { BinaryExpr BitXor $1 $3 }
        | Expr10 {$1}

      Expr10
        : Expr9 AND  Expr10 { BinaryExpr BitAnd $1 $3 }
        | Expr9 {$1}

      Expr9
        : Expr8 Op9  Expr9 { BinaryExpr $2 $1 $3 }
        | Expr8 {$1}

      Op9
        : EQ {Eq}
        |  NOTEQ {NotEq}

      Expr8
        : Expr7 Op8  Expr8 { BinaryExpr $2 $1 $3 }
        | Expr7 {$1}

      Op8
        : LT {Lt}
        |  GT {Gt}
        | LTE {Lte}
        | GTE {Gte}

      Expr7
        : Expr6 Op7  Expr7 { BinaryExpr $2 $1 $3 }
        | Expr6 {$1}

      Op7
        : RSHIFT {RShift}
        |  LSHIFT {LShift}

      Expr6
        : Expr5 Op6  Expr6 { BinaryExpr $2 $1 $3 }
        | Expr5 {$1}

      Op6
        : PLUS  {Add}
        |  MINUS {Sub}

      Expr5
        : Expr3 Op5  Expr5 { BinaryExpr $2 $1 $3 }
        | Expr3 {$1}

      Op5
        : MUL  {Mul}
        |  DIV {Div}
        | EUCDIV {EucDiv}

      Expr3
        : UnOp Expr3 { UnaryExpr Pos $2 }
        | Atom { SingleExpr $1 }

      UnOp
      : PLUS {Pos}
      | MINUS {Neg}
      | NOT {Not}
      | INV {Inv}

      Atom
        : Name { VarAtom $1 }
        | TRUE { T }
        | FALSE { F }
        | NUMBER { VarAtom (Name $1) }
        | LEFTP Assig RIGHTP {ExprPar $2 }

{
parseError = fail "Parse error"
}
