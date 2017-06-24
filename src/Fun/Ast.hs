-------------------------------------------------------------------------------
--
-- Abstract syntax tree of the 'Fun' language.
--
-------------------------------------------------------------------------------

module Fun.Ast
  ( Name
  , Expr(..)
  , Literal(..)
  , BinOp(..)
  ) where


-- | An identifier.
type Name = String


-- | Expressions.
data Expr =
    Literal     Literal
  | Var         Name
  | Fn          Name  Expr
  | App         Expr  Expr
  | Let         Name  Expr  Expr
  | IfThenElse  Expr  Expr  Expr
  | Op          BinOp Expr  Expr
  deriving (Eq, Ord)


-- | Builtin literal types.
data Literal =
    IntLit  Integer
  | BoolLit Bool
  deriving (Eq, Ord)


-- | Builtin binary operations.
data BinOp =
  -- Arithmetic operations '+', '-', '*', '/'
    OpAdd | OpSub | OpMul | OpDiv
  -- Relational operations '==', '!=', '<', '>', '<=', '>='
  | OpEQ | OpNEQ | OpLT | OpGT | OpLTE | OpGTE
  deriving (Eq, Ord)
