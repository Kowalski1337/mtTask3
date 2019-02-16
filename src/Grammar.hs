 module Grammar where

data Code = Final Single | Other Single Code

data Single = Inc Include | Func Function | Var Variable

data Include = Quotes String | Brackets String

data Variable = Default TypeName Assig

data TypeName = SimpleType String

data VarName = Name String

data Function = Fun TypeName VarName Arguments Block

data Arguments = Zero | One TypeName VarName | More TypeName VarName Arguments

data Block = Par Internal | EmptyBlock

data Internal = SinglePart CodeLine |  MultipleLines CodeLine Internal

data CodeLine = Assignment Term  | ForLoop For | WhileLoop While | Conditional If | Inits Variable | Part Block | Return Term

data If = StandartIf Assig Block | IfElse Assig Block Block

data For = IterType TypeName Term Term Term Block |Iter Term Term Term Block | ForEach VarName VarName Block | ForEachType TypeName VarName VarName Block

data While = StandartWhile Assig Block

data Term = NotEmpty Assig | EmptyTerm

data Expr = BinaryExpr BinaryOp Expr Expr | UnaryExpr UnaryOp Expr | SingleExpr Atom

data BinaryOp = Mul | Div | Add | Sub | BitAnd | BitOr | BitXor | LShift | RShift | EucDiv | And | Or | Eq | NotEq | Lt | Gt | Lte | Gte

data UnaryOp = Not | Neg | Pos | Inv | PPPref | MMPref | PPSuff | MMSuff

data Atom = VarAtom VarName | T | F  | ExprPar Assig

data Assig = SimpleAssig AssigOp VarName Assig | WithOutAssig Expr | Lol

data AssigOp =  PlusEq | SubEq | DivEq | MulEq | EucDivEq | LShiftEq | RShiftEq | OrEq | AndEq | XorEq | As


----show
instance Show Code where
  show (Final s) = show s
  show (Other s cont) = show s ++ "\n" ++ show cont

instance Show Single where
  show (Inc i) = show i
  show (Func i) = show i
  show (Var i) = show i

instance Show Include where
  show (Quotes s) = "#include <" ++ s ++ ">"
  show (Brackets s) = "#include \"" ++ s ++ "\""

instance Show Variable where
  show (Default tp var) = (show tp) ++ " " ++ (show var) ++ ";"

instance Show TypeName where
  show (SimpleType t) = t

instance Show VarName where
  show (Name n) = n

instance Show Function where
  show (Fun t n a b) = (show t) ++ " " ++ (show n) ++ " (" ++ (show a) ++ ") " ++ (showBlock "" b)

instance Show Arguments where
  show Zero = ""
  show (One tp var) = (show tp) ++ " " ++ (show var)
  show (More tp var other) = (show tp) ++ " " ++ (show var) ++ ", " ++ (show other)


showBlock :: String -> Block -> String
showBlock s (Par i) = "{\n" ++ (showInternal ('\t' : s) i) ++ "\n"  ++ s ++ "}"
showBlock s EmptyBlock = "{\n" ++ "\n" ++ s++"}"

showInternal :: String -> Internal -> String
showInternal s (SinglePart line) = s ++ showCodeLine s line
showInternal s (MultipleLines line int) = s ++ (showCodeLine s line) ++ "\n" ++ (showInternal s int)

showCodeLine :: String -> CodeLine -> String
showCodeLine s (Assignment a) = show a ++ ";"
showCodeLine s (ForLoop f) = showFor s f
showCodeLine s (WhileLoop while) = showWhile s while
showCodeLine s (Conditional i) = showIf s i
showCodeLine s (Inits var) = show var
showCodeLine s (Part b) = showBlock s b
showCodeLine s (Return EmptyTerm) = "return;"
showCodeLine s (Return t) = "return " ++ (show t) ++ ";"

showIf :: String -> If -> String
showIf s (StandartIf e b) = "if (" ++ (show e) ++ ") " ++ (showBlock s b)
showIf s (IfElse e b1 b2) = "if (" ++ (show e) ++ ") " ++ (showBlock s b1) ++ " else " ++ (showBlock s b2)

showFor :: String -> For -> String
showFor s (IterType t0 t1 t2 t3 b) = "for (" ++ (show t0) ++ " " ++ (show t1) ++ "; " ++ (show t2) ++ "; " ++ (show t3) ++ ") " ++ (showBlock s b)
showFor s (Iter t1 t2 t3 b) = "for (" ++ (show t1) ++ "; " ++ (show t2) ++ "; " ++ (show t3) ++ ") " ++ (showBlock s b)
showFor s (ForEach v1 v2 b) = "for (" ++ (show v1) ++ " : " ++ (show v2) ++ ") " ++ (showBlock s b)
showFor s (ForEachType t v1 v2 b) = "for (" ++ (show t)

showWhile :: String -> While -> String
showWhile s (StandartWhile t b) = "while (" ++ (show t) ++ ") " ++ (showBlock s b)

instance Show Term where
  show (NotEmpty expr) = show expr
  show EmptyTerm = ""

instance Show Expr where
  show (BinaryExpr op e1 e2) = (show e1) ++ " " ++ (show op) ++ " " ++ (show e2)
  show (UnaryExpr PPSuff e) = (show e) ++ "++"
  show (UnaryExpr MMSuff e) = (show e) ++ "--"
  show (UnaryExpr op e) = (show op) ++ (show e)
  show (SingleExpr e) = show e

instance Show Atom where
  show T = "true"
  show F = "false"
  show (VarAtom name) = show name
  show (ExprPar e) = "(" ++ (show e) ++ ")"

instance Show BinaryOp where
  show And = "&&"
  show Or = "||"
  show Eq = "=="
  show NotEq = "!="
  show Gt = ">"
  show Lt = "<"
  show Gte = ">="
  show Lte = "<="
  show Mul = "*"
  show Div = "/"
  show Add = "+"
  show Sub = "-"
  show BitAnd = "&"
  show BitOr = "|"
  show LShift = "<<"
  show RShift = ">>"
  show EucDiv = "%"
  show BitXor = "^"

instance Show UnaryOp where
  show Neg = "-"
  show Pos = "+"
  show Inv = "~"
  show Not = "!"
  show PPPref = "++"
  show PPSuff = "++"
  show MMPref = "--"
  show MMSuff = "--"


instance Show Assig where
  show (SimpleAssig op var e) = (show var) ++ " " ++ (show op) ++ " " ++ (show e)
  show (WithOutAssig expr) = show expr
  show Lol = "Lol"

instance Show AssigOp where
  show PlusEq = "+="
  show SubEq = "-="
  show MulEq = "*="
  show DivEq = "/="
  show EucDivEq = "%="
  show LShiftEq = "<<="
  show RShiftEq = ">>="
  show AndEq = "&="
  show OrEq = "|="
  show XorEq = "^="
  show As = "="
