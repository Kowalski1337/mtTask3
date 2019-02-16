{-# OPTIONS_GHC -w #-}
module Parser where

import Grammar
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34
	| HappyAbsSyn35 t35
	| HappyAbsSyn36 t36
	| HappyAbsSyn37 t37
	| HappyAbsSyn38 t38
	| HappyAbsSyn39 t39
	| HappyAbsSyn40 t40

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,874) ([0,0,512,0,0,16,0,0,32,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,256,0,0,0,0,0,0,0,0,2,0,4096,0,0,0,0,0,0,0,0,512,0,0,0,0,0,32,0,0,0,0,0,16,0,9216,0,0,0,0,0,0,0,0,0,0,0,64,0,0,1056,0,0,0,0,0,0,0,0,0,0,61440,32769,32835,1,0,0,0,0,0,256,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2046,0,32,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,8,0,0,0,0,1024,0,0,0,0,0,0,0,4,0,0,0,8,0,0,0,0,0,96,0,0,0,0,0,120,0,0,0,0,768,0,0,0,49152,0,0,0,0,0,40960,1,0,0,0,0,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,14336,6148,0,0,0,496,17280,384,0,0,0,31,1080,24,0,0,8192,1,0,0,0,0,4608,0,0,0,0,0,496,17280,384,0,0,0,31,1080,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,14336,63492,198,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,496,17280,28544,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,256,0,0,0,0,0,16,0,0,0,0,0,1,0,0,0,0,7936,14336,6148,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,288,0,0,0,0,0,0,0,0,0,0,0,32736,0,512,0,0,16384,0,0,0,0,0,1024,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,1080,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,1080,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,17280,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,14336,6148,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,17280,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,14336,6148,0,0,0,496,17280,384,0,0,0,31,1080,24,0,0,61440,32769,32835,1,0,0,7936,14336,6148,0,0,0,0,0,0,0,0,0,31,1080,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,32769,32835,1,0,0,0,2046,0,32,0,0,1024,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,496,17280,384,0,0,0,31,1080,24,0,0,61440,32769,32835,65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,576,0,0,7936,14336,6148,4,0,0,57344,127,0,34,0,0,31,1080,1048,0,0,0,4,0,0,0,0,16384,0,0,0,0,0,32,0,0,0,0,0,64,0,0,0,0,61440,32769,32835,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,4,0,0,0,0,16384,0,0,61440,32773,32835,1,0,0,512,0,0,0,0,0,57344,127,0,34,0,0,31,1080,1048,0,0,61440,32773,32835,1,0,0,512,0,0,0,0,0,1024,0,0,0,0,0,64,0,0,0,0,0,0,0,1024,0,0,0,0,0,1,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,1024,0,0,16384,0,0,0,0,0,1024,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseExpr","Code","Single","Include","Variable","Type","Name","Function","Args","MoreArgs","Block","Internal","CodeLine","Return","If","For","While","Term","Assig","AssigOp","Expr14","Expr13","Expr12","Expr11","Expr10","Expr9","Op9","Expr8","Op8","Expr7","Op7","Expr6","Op6","Expr5","Op5","Expr3","Atom","AtomExt","NUMBER","IDEN","MINUS","PLUS","LEFTP","MUL","RIGHTP","DIV","EUCDIV","PLUSEQ","SUBEQ","MULEQ","DIVEQ","EUCDIVEQ","RSHIFTEQ","LSHIFTEQ","ANDEQ","OREQ","XOREQ","PP","MM","INV","OR","AND","RSHIFT","LSHIFT","NOT","ANDAND","OROR","EQ","NOTEQ","GT","LT","GTE","LTE","TRUE","FALSE","FOR","IF","WHILE","ELSE","RETURN","SEMI","COMMA","INCLUDE","AS","LPAR","RPAR","QUOTES","COLON","XOR","%eof"]
        bit_start = st * 92
        bit_end = (st + 1) * 92
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..91]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (42) = happyShift action_7
action_0 (85) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_10
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (10) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (42) = happyShift action_7
action_1 (85) = happyShift action_8
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (10) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_3

action_4 _ = happyReduce_5

action_5 (42) = happyShift action_15
action_5 (9) = happyGoto action_14
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_4

action_7 _ = happyReduce_10

action_8 (73) = happyShift action_12
action_8 (89) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (92) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (42) = happyShift action_7
action_10 (85) = happyShift action_8
action_10 (4) = happyGoto action_11
action_10 (5) = happyGoto action_10
action_10 (6) = happyGoto action_3
action_10 (7) = happyGoto action_4
action_10 (8) = happyGoto action_5
action_10 (10) = happyGoto action_6
action_10 _ = happyReduce_1

action_11 _ = happyReduce_2

action_12 (42) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (42) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (45) = happyShift action_17
action_14 (83) = happyShift action_18
action_14 (86) = happyShift action_19
action_14 (11) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_11

action_16 (87) = happyShift action_52
action_16 (13) = happyGoto action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (42) = happyShift action_7
action_17 (47) = happyShift action_50
action_17 (8) = happyGoto action_49
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_8

action_19 (41) = happyShift action_39
action_19 (42) = happyShift action_15
action_19 (43) = happyShift action_40
action_19 (44) = happyShift action_41
action_19 (45) = happyShift action_42
action_19 (60) = happyShift action_43
action_19 (61) = happyShift action_44
action_19 (62) = happyShift action_45
action_19 (67) = happyShift action_46
action_19 (76) = happyShift action_47
action_19 (77) = happyShift action_48
action_19 (9) = happyGoto action_24
action_19 (21) = happyGoto action_25
action_19 (23) = happyGoto action_26
action_19 (24) = happyGoto action_27
action_19 (25) = happyGoto action_28
action_19 (26) = happyGoto action_29
action_19 (27) = happyGoto action_30
action_19 (28) = happyGoto action_31
action_19 (30) = happyGoto action_32
action_19 (32) = happyGoto action_33
action_19 (34) = happyGoto action_34
action_19 (36) = happyGoto action_35
action_19 (38) = happyGoto action_36
action_19 (39) = happyGoto action_37
action_19 (40) = happyGoto action_38
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (89) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (72) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_7

action_23 _ = happyReduce_6

action_24 (50) = happyShift action_111
action_24 (51) = happyShift action_112
action_24 (52) = happyShift action_113
action_24 (53) = happyShift action_114
action_24 (54) = happyShift action_115
action_24 (55) = happyShift action_116
action_24 (56) = happyShift action_117
action_24 (57) = happyShift action_118
action_24 (58) = happyShift action_119
action_24 (59) = happyShift action_120
action_24 (60) = happyReduce_96
action_24 (61) = happyReduce_96
action_24 (86) = happyShift action_121
action_24 (22) = happyGoto action_110
action_24 _ = happyReduce_99

action_25 (83) = happyShift action_109
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_42

action_27 (69) = happyShift action_108
action_27 _ = happyReduce_55

action_28 (68) = happyShift action_107
action_28 _ = happyReduce_57

action_29 (63) = happyShift action_106
action_29 _ = happyReduce_59

action_30 (91) = happyShift action_105
action_30 _ = happyReduce_61

action_31 (64) = happyShift action_104
action_31 _ = happyReduce_63

action_32 (70) = happyShift action_102
action_32 (71) = happyShift action_103
action_32 (29) = happyGoto action_101
action_32 _ = happyReduce_65

action_33 (72) = happyShift action_97
action_33 (73) = happyShift action_98
action_33 (74) = happyShift action_99
action_33 (75) = happyShift action_100
action_33 (31) = happyGoto action_96
action_33 _ = happyReduce_69

action_34 (65) = happyShift action_94
action_34 (66) = happyShift action_95
action_34 (33) = happyGoto action_93
action_34 _ = happyReduce_75

action_35 (43) = happyShift action_91
action_35 (44) = happyShift action_92
action_35 (35) = happyGoto action_90
action_35 _ = happyReduce_79

action_36 (46) = happyShift action_87
action_36 (48) = happyShift action_88
action_36 (49) = happyShift action_89
action_36 (37) = happyGoto action_86
action_36 _ = happyReduce_83

action_37 (60) = happyShift action_84
action_37 (61) = happyShift action_85
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_95

action_39 _ = happyReduce_102

action_40 (41) = happyShift action_39
action_40 (42) = happyShift action_15
action_40 (43) = happyShift action_40
action_40 (44) = happyShift action_41
action_40 (45) = happyShift action_42
action_40 (60) = happyShift action_43
action_40 (61) = happyShift action_44
action_40 (62) = happyShift action_45
action_40 (67) = happyShift action_46
action_40 (76) = happyShift action_47
action_40 (77) = happyShift action_48
action_40 (9) = happyGoto action_72
action_40 (38) = happyGoto action_83
action_40 (39) = happyGoto action_37
action_40 (40) = happyGoto action_38
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (41) = happyShift action_39
action_41 (42) = happyShift action_15
action_41 (43) = happyShift action_40
action_41 (44) = happyShift action_41
action_41 (45) = happyShift action_42
action_41 (60) = happyShift action_43
action_41 (61) = happyShift action_44
action_41 (62) = happyShift action_45
action_41 (67) = happyShift action_46
action_41 (76) = happyShift action_47
action_41 (77) = happyShift action_48
action_41 (9) = happyGoto action_72
action_41 (38) = happyGoto action_82
action_41 (39) = happyGoto action_37
action_41 (40) = happyGoto action_38
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (41) = happyShift action_39
action_42 (42) = happyShift action_15
action_42 (43) = happyShift action_40
action_42 (44) = happyShift action_41
action_42 (45) = happyShift action_42
action_42 (60) = happyShift action_43
action_42 (61) = happyShift action_44
action_42 (62) = happyShift action_45
action_42 (67) = happyShift action_46
action_42 (76) = happyShift action_47
action_42 (77) = happyShift action_48
action_42 (9) = happyGoto action_79
action_42 (21) = happyGoto action_80
action_42 (23) = happyGoto action_26
action_42 (24) = happyGoto action_27
action_42 (25) = happyGoto action_28
action_42 (26) = happyGoto action_29
action_42 (27) = happyGoto action_30
action_42 (28) = happyGoto action_31
action_42 (30) = happyGoto action_32
action_42 (32) = happyGoto action_33
action_42 (34) = happyGoto action_34
action_42 (36) = happyGoto action_35
action_42 (38) = happyGoto action_36
action_42 (39) = happyGoto action_81
action_42 (40) = happyGoto action_38
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (42) = happyShift action_15
action_43 (45) = happyShift action_77
action_43 (9) = happyGoto action_75
action_43 (39) = happyGoto action_78
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_15
action_44 (45) = happyShift action_77
action_44 (9) = happyGoto action_75
action_44 (39) = happyGoto action_76
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (41) = happyShift action_39
action_45 (42) = happyShift action_15
action_45 (43) = happyShift action_40
action_45 (44) = happyShift action_41
action_45 (45) = happyShift action_42
action_45 (60) = happyShift action_43
action_45 (61) = happyShift action_44
action_45 (62) = happyShift action_45
action_45 (67) = happyShift action_46
action_45 (76) = happyShift action_47
action_45 (77) = happyShift action_48
action_45 (9) = happyGoto action_72
action_45 (38) = happyGoto action_74
action_45 (39) = happyGoto action_37
action_45 (40) = happyGoto action_38
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (41) = happyShift action_39
action_46 (42) = happyShift action_15
action_46 (43) = happyShift action_40
action_46 (44) = happyShift action_41
action_46 (45) = happyShift action_42
action_46 (60) = happyShift action_43
action_46 (61) = happyShift action_44
action_46 (62) = happyShift action_45
action_46 (67) = happyShift action_46
action_46 (76) = happyShift action_47
action_46 (77) = happyShift action_48
action_46 (9) = happyGoto action_72
action_46 (38) = happyGoto action_73
action_46 (39) = happyGoto action_37
action_46 (40) = happyGoto action_38
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_100

action_48 _ = happyReduce_101

action_49 (42) = happyShift action_15
action_49 (9) = happyGoto action_71
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_13

action_51 _ = happyReduce_12

action_52 (41) = happyShift action_39
action_52 (42) = happyShift action_64
action_52 (43) = happyShift action_40
action_52 (44) = happyShift action_41
action_52 (45) = happyShift action_42
action_52 (60) = happyShift action_43
action_52 (61) = happyShift action_44
action_52 (62) = happyShift action_45
action_52 (67) = happyShift action_46
action_52 (76) = happyShift action_47
action_52 (77) = happyShift action_48
action_52 (78) = happyShift action_65
action_52 (79) = happyShift action_66
action_52 (80) = happyShift action_67
action_52 (82) = happyShift action_68
action_52 (83) = happyShift action_69
action_52 (87) = happyShift action_52
action_52 (88) = happyShift action_70
action_52 (7) = happyGoto action_53
action_52 (8) = happyGoto action_54
action_52 (9) = happyGoto action_24
action_52 (13) = happyGoto action_55
action_52 (14) = happyGoto action_56
action_52 (15) = happyGoto action_57
action_52 (16) = happyGoto action_58
action_52 (17) = happyGoto action_59
action_52 (18) = happyGoto action_60
action_52 (19) = happyGoto action_61
action_52 (20) = happyGoto action_62
action_52 (21) = happyGoto action_63
action_52 (23) = happyGoto action_26
action_52 (24) = happyGoto action_27
action_52 (25) = happyGoto action_28
action_52 (26) = happyGoto action_29
action_52 (27) = happyGoto action_30
action_52 (28) = happyGoto action_31
action_52 (30) = happyGoto action_32
action_52 (32) = happyGoto action_33
action_52 (34) = happyGoto action_34
action_52 (36) = happyGoto action_35
action_52 (38) = happyGoto action_36
action_52 (39) = happyGoto action_37
action_52 (40) = happyGoto action_38
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_26

action_54 (42) = happyShift action_15
action_54 (9) = happyGoto action_147
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_27

action_56 (88) = happyShift action_146
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (41) = happyShift action_39
action_57 (42) = happyShift action_64
action_57 (43) = happyShift action_40
action_57 (44) = happyShift action_41
action_57 (45) = happyShift action_42
action_57 (60) = happyShift action_43
action_57 (61) = happyShift action_44
action_57 (62) = happyShift action_45
action_57 (67) = happyShift action_46
action_57 (76) = happyShift action_47
action_57 (77) = happyShift action_48
action_57 (78) = happyShift action_65
action_57 (79) = happyShift action_66
action_57 (80) = happyShift action_67
action_57 (82) = happyShift action_68
action_57 (83) = happyShift action_69
action_57 (87) = happyShift action_52
action_57 (7) = happyGoto action_53
action_57 (8) = happyGoto action_54
action_57 (9) = happyGoto action_24
action_57 (13) = happyGoto action_55
action_57 (14) = happyGoto action_145
action_57 (15) = happyGoto action_57
action_57 (16) = happyGoto action_58
action_57 (17) = happyGoto action_59
action_57 (18) = happyGoto action_60
action_57 (19) = happyGoto action_61
action_57 (20) = happyGoto action_62
action_57 (21) = happyGoto action_63
action_57 (23) = happyGoto action_26
action_57 (24) = happyGoto action_27
action_57 (25) = happyGoto action_28
action_57 (26) = happyGoto action_29
action_57 (27) = happyGoto action_30
action_57 (28) = happyGoto action_31
action_57 (30) = happyGoto action_32
action_57 (32) = happyGoto action_33
action_57 (34) = happyGoto action_34
action_57 (36) = happyGoto action_35
action_57 (38) = happyGoto action_36
action_57 (39) = happyGoto action_37
action_57 (40) = happyGoto action_38
action_57 _ = happyReduce_20

action_58 _ = happyReduce_28

action_59 _ = happyReduce_25

action_60 _ = happyReduce_23

action_61 _ = happyReduce_24

action_62 _ = happyReduce_22

action_63 (83) = happyShift action_144
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (43) = happyReduce_11
action_64 (44) = happyReduce_11
action_64 (46) = happyReduce_11
action_64 (48) = happyReduce_11
action_64 (49) = happyReduce_11
action_64 (50) = happyReduce_11
action_64 (51) = happyReduce_11
action_64 (52) = happyReduce_11
action_64 (53) = happyReduce_11
action_64 (54) = happyReduce_11
action_64 (55) = happyReduce_11
action_64 (56) = happyReduce_11
action_64 (57) = happyReduce_11
action_64 (58) = happyReduce_11
action_64 (59) = happyReduce_11
action_64 (60) = happyReduce_11
action_64 (61) = happyReduce_11
action_64 (63) = happyReduce_11
action_64 (64) = happyReduce_11
action_64 (65) = happyReduce_11
action_64 (66) = happyReduce_11
action_64 (68) = happyReduce_11
action_64 (69) = happyReduce_11
action_64 (70) = happyReduce_11
action_64 (71) = happyReduce_11
action_64 (72) = happyReduce_11
action_64 (73) = happyReduce_11
action_64 (74) = happyReduce_11
action_64 (75) = happyReduce_11
action_64 (83) = happyReduce_11
action_64 (86) = happyReduce_11
action_64 (90) = happyReduce_11
action_64 (91) = happyReduce_11
action_64 _ = happyReduce_10

action_65 (45) = happyShift action_143
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (45) = happyShift action_142
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (45) = happyShift action_141
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (41) = happyShift action_39
action_68 (42) = happyShift action_15
action_68 (43) = happyShift action_40
action_68 (44) = happyShift action_41
action_68 (45) = happyShift action_42
action_68 (60) = happyShift action_43
action_68 (61) = happyShift action_44
action_68 (62) = happyShift action_45
action_68 (67) = happyShift action_46
action_68 (76) = happyShift action_47
action_68 (77) = happyShift action_48
action_68 (83) = happyShift action_69
action_68 (9) = happyGoto action_24
action_68 (20) = happyGoto action_140
action_68 (21) = happyGoto action_63
action_68 (23) = happyGoto action_26
action_68 (24) = happyGoto action_27
action_68 (25) = happyGoto action_28
action_68 (26) = happyGoto action_29
action_68 (27) = happyGoto action_30
action_68 (28) = happyGoto action_31
action_68 (30) = happyGoto action_32
action_68 (32) = happyGoto action_33
action_68 (34) = happyGoto action_34
action_68 (36) = happyGoto action_35
action_68 (38) = happyGoto action_36
action_68 (39) = happyGoto action_37
action_68 (40) = happyGoto action_38
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_39

action_70 _ = happyReduce_19

action_71 (47) = happyShift action_138
action_71 (84) = happyShift action_139
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (60) = happyReduce_96
action_72 (61) = happyReduce_96
action_72 _ = happyReduce_99

action_73 _ = happyReduce_91

action_74 _ = happyReduce_92

action_75 _ = happyReduce_96

action_76 _ = happyReduce_88

action_77 (42) = happyShift action_15
action_77 (45) = happyShift action_77
action_77 (9) = happyGoto action_136
action_77 (39) = happyGoto action_137
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_87

action_79 (47) = happyReduce_99
action_79 (50) = happyShift action_111
action_79 (51) = happyShift action_112
action_79 (52) = happyShift action_113
action_79 (53) = happyShift action_114
action_79 (54) = happyShift action_115
action_79 (55) = happyShift action_116
action_79 (56) = happyShift action_117
action_79 (57) = happyShift action_118
action_79 (58) = happyShift action_119
action_79 (59) = happyShift action_120
action_79 (60) = happyReduce_96
action_79 (61) = happyReduce_96
action_79 (86) = happyShift action_121
action_79 (22) = happyGoto action_135
action_79 _ = happyReduce_99

action_80 (47) = happyShift action_134
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (47) = happyShift action_133
action_81 (60) = happyShift action_84
action_81 (61) = happyShift action_85
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_89

action_83 _ = happyReduce_90

action_84 _ = happyReduce_93

action_85 _ = happyReduce_94

action_86 (41) = happyShift action_39
action_86 (42) = happyShift action_15
action_86 (43) = happyShift action_40
action_86 (44) = happyShift action_41
action_86 (45) = happyShift action_42
action_86 (60) = happyShift action_43
action_86 (61) = happyShift action_44
action_86 (62) = happyShift action_45
action_86 (67) = happyShift action_46
action_86 (76) = happyShift action_47
action_86 (77) = happyShift action_48
action_86 (9) = happyGoto action_72
action_86 (36) = happyGoto action_132
action_86 (38) = happyGoto action_36
action_86 (39) = happyGoto action_37
action_86 (40) = happyGoto action_38
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_84

action_88 _ = happyReduce_85

action_89 _ = happyReduce_86

action_90 (41) = happyShift action_39
action_90 (42) = happyShift action_15
action_90 (43) = happyShift action_40
action_90 (44) = happyShift action_41
action_90 (45) = happyShift action_42
action_90 (60) = happyShift action_43
action_90 (61) = happyShift action_44
action_90 (62) = happyShift action_45
action_90 (67) = happyShift action_46
action_90 (76) = happyShift action_47
action_90 (77) = happyShift action_48
action_90 (9) = happyGoto action_72
action_90 (34) = happyGoto action_131
action_90 (36) = happyGoto action_35
action_90 (38) = happyGoto action_36
action_90 (39) = happyGoto action_37
action_90 (40) = happyGoto action_38
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_81

action_92 _ = happyReduce_80

action_93 (41) = happyShift action_39
action_93 (42) = happyShift action_15
action_93 (43) = happyShift action_40
action_93 (44) = happyShift action_41
action_93 (45) = happyShift action_42
action_93 (60) = happyShift action_43
action_93 (61) = happyShift action_44
action_93 (62) = happyShift action_45
action_93 (67) = happyShift action_46
action_93 (76) = happyShift action_47
action_93 (77) = happyShift action_48
action_93 (9) = happyGoto action_72
action_93 (32) = happyGoto action_130
action_93 (34) = happyGoto action_34
action_93 (36) = happyGoto action_35
action_93 (38) = happyGoto action_36
action_93 (39) = happyGoto action_37
action_93 (40) = happyGoto action_38
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_76

action_95 _ = happyReduce_77

action_96 (41) = happyShift action_39
action_96 (42) = happyShift action_15
action_96 (43) = happyShift action_40
action_96 (44) = happyShift action_41
action_96 (45) = happyShift action_42
action_96 (60) = happyShift action_43
action_96 (61) = happyShift action_44
action_96 (62) = happyShift action_45
action_96 (67) = happyShift action_46
action_96 (76) = happyShift action_47
action_96 (77) = happyShift action_48
action_96 (9) = happyGoto action_72
action_96 (30) = happyGoto action_129
action_96 (32) = happyGoto action_33
action_96 (34) = happyGoto action_34
action_96 (36) = happyGoto action_35
action_96 (38) = happyGoto action_36
action_96 (39) = happyGoto action_37
action_96 (40) = happyGoto action_38
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_71

action_98 _ = happyReduce_70

action_99 _ = happyReduce_73

action_100 _ = happyReduce_72

action_101 (41) = happyShift action_39
action_101 (42) = happyShift action_15
action_101 (43) = happyShift action_40
action_101 (44) = happyShift action_41
action_101 (45) = happyShift action_42
action_101 (60) = happyShift action_43
action_101 (61) = happyShift action_44
action_101 (62) = happyShift action_45
action_101 (67) = happyShift action_46
action_101 (76) = happyShift action_47
action_101 (77) = happyShift action_48
action_101 (9) = happyGoto action_72
action_101 (28) = happyGoto action_128
action_101 (30) = happyGoto action_32
action_101 (32) = happyGoto action_33
action_101 (34) = happyGoto action_34
action_101 (36) = happyGoto action_35
action_101 (38) = happyGoto action_36
action_101 (39) = happyGoto action_37
action_101 (40) = happyGoto action_38
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_66

action_103 _ = happyReduce_67

action_104 (41) = happyShift action_39
action_104 (42) = happyShift action_15
action_104 (43) = happyShift action_40
action_104 (44) = happyShift action_41
action_104 (45) = happyShift action_42
action_104 (60) = happyShift action_43
action_104 (61) = happyShift action_44
action_104 (62) = happyShift action_45
action_104 (67) = happyShift action_46
action_104 (76) = happyShift action_47
action_104 (77) = happyShift action_48
action_104 (9) = happyGoto action_72
action_104 (27) = happyGoto action_127
action_104 (28) = happyGoto action_31
action_104 (30) = happyGoto action_32
action_104 (32) = happyGoto action_33
action_104 (34) = happyGoto action_34
action_104 (36) = happyGoto action_35
action_104 (38) = happyGoto action_36
action_104 (39) = happyGoto action_37
action_104 (40) = happyGoto action_38
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (41) = happyShift action_39
action_105 (42) = happyShift action_15
action_105 (43) = happyShift action_40
action_105 (44) = happyShift action_41
action_105 (45) = happyShift action_42
action_105 (60) = happyShift action_43
action_105 (61) = happyShift action_44
action_105 (62) = happyShift action_45
action_105 (67) = happyShift action_46
action_105 (76) = happyShift action_47
action_105 (77) = happyShift action_48
action_105 (9) = happyGoto action_72
action_105 (26) = happyGoto action_126
action_105 (27) = happyGoto action_30
action_105 (28) = happyGoto action_31
action_105 (30) = happyGoto action_32
action_105 (32) = happyGoto action_33
action_105 (34) = happyGoto action_34
action_105 (36) = happyGoto action_35
action_105 (38) = happyGoto action_36
action_105 (39) = happyGoto action_37
action_105 (40) = happyGoto action_38
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (41) = happyShift action_39
action_106 (42) = happyShift action_15
action_106 (43) = happyShift action_40
action_106 (44) = happyShift action_41
action_106 (45) = happyShift action_42
action_106 (60) = happyShift action_43
action_106 (61) = happyShift action_44
action_106 (62) = happyShift action_45
action_106 (67) = happyShift action_46
action_106 (76) = happyShift action_47
action_106 (77) = happyShift action_48
action_106 (9) = happyGoto action_72
action_106 (25) = happyGoto action_125
action_106 (26) = happyGoto action_29
action_106 (27) = happyGoto action_30
action_106 (28) = happyGoto action_31
action_106 (30) = happyGoto action_32
action_106 (32) = happyGoto action_33
action_106 (34) = happyGoto action_34
action_106 (36) = happyGoto action_35
action_106 (38) = happyGoto action_36
action_106 (39) = happyGoto action_37
action_106 (40) = happyGoto action_38
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (41) = happyShift action_39
action_107 (42) = happyShift action_15
action_107 (43) = happyShift action_40
action_107 (44) = happyShift action_41
action_107 (45) = happyShift action_42
action_107 (60) = happyShift action_43
action_107 (61) = happyShift action_44
action_107 (62) = happyShift action_45
action_107 (67) = happyShift action_46
action_107 (76) = happyShift action_47
action_107 (77) = happyShift action_48
action_107 (9) = happyGoto action_72
action_107 (24) = happyGoto action_124
action_107 (25) = happyGoto action_28
action_107 (26) = happyGoto action_29
action_107 (27) = happyGoto action_30
action_107 (28) = happyGoto action_31
action_107 (30) = happyGoto action_32
action_107 (32) = happyGoto action_33
action_107 (34) = happyGoto action_34
action_107 (36) = happyGoto action_35
action_107 (38) = happyGoto action_36
action_107 (39) = happyGoto action_37
action_107 (40) = happyGoto action_38
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (41) = happyShift action_39
action_108 (42) = happyShift action_15
action_108 (43) = happyShift action_40
action_108 (44) = happyShift action_41
action_108 (45) = happyShift action_42
action_108 (60) = happyShift action_43
action_108 (61) = happyShift action_44
action_108 (62) = happyShift action_45
action_108 (67) = happyShift action_46
action_108 (76) = happyShift action_47
action_108 (77) = happyShift action_48
action_108 (9) = happyGoto action_72
action_108 (23) = happyGoto action_123
action_108 (24) = happyGoto action_27
action_108 (25) = happyGoto action_28
action_108 (26) = happyGoto action_29
action_108 (27) = happyGoto action_30
action_108 (28) = happyGoto action_31
action_108 (30) = happyGoto action_32
action_108 (32) = happyGoto action_33
action_108 (34) = happyGoto action_34
action_108 (36) = happyGoto action_35
action_108 (38) = happyGoto action_36
action_108 (39) = happyGoto action_37
action_108 (40) = happyGoto action_38
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_9

action_110 (41) = happyShift action_39
action_110 (42) = happyShift action_15
action_110 (43) = happyShift action_40
action_110 (44) = happyShift action_41
action_110 (45) = happyShift action_42
action_110 (60) = happyShift action_43
action_110 (61) = happyShift action_44
action_110 (62) = happyShift action_45
action_110 (67) = happyShift action_46
action_110 (76) = happyShift action_47
action_110 (77) = happyShift action_48
action_110 (9) = happyGoto action_24
action_110 (21) = happyGoto action_122
action_110 (23) = happyGoto action_26
action_110 (24) = happyGoto action_27
action_110 (25) = happyGoto action_28
action_110 (26) = happyGoto action_29
action_110 (27) = happyGoto action_30
action_110 (28) = happyGoto action_31
action_110 (30) = happyGoto action_32
action_110 (32) = happyGoto action_33
action_110 (34) = happyGoto action_34
action_110 (36) = happyGoto action_35
action_110 (38) = happyGoto action_36
action_110 (39) = happyGoto action_37
action_110 (40) = happyGoto action_38
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_43

action_112 _ = happyReduce_44

action_113 _ = happyReduce_45

action_114 _ = happyReduce_46

action_115 _ = happyReduce_47

action_116 _ = happyReduce_49

action_117 _ = happyReduce_48

action_118 _ = happyReduce_51

action_119 _ = happyReduce_50

action_120 _ = happyReduce_52

action_121 _ = happyReduce_53

action_122 _ = happyReduce_41

action_123 _ = happyReduce_54

action_124 _ = happyReduce_56

action_125 _ = happyReduce_58

action_126 _ = happyReduce_60

action_127 _ = happyReduce_62

action_128 _ = happyReduce_64

action_129 _ = happyReduce_68

action_130 _ = happyReduce_74

action_131 _ = happyReduce_78

action_132 _ = happyReduce_82

action_133 _ = happyReduce_98

action_134 _ = happyReduce_103

action_135 (41) = happyShift action_39
action_135 (42) = happyShift action_15
action_135 (43) = happyShift action_40
action_135 (44) = happyShift action_41
action_135 (45) = happyShift action_42
action_135 (60) = happyShift action_43
action_135 (61) = happyShift action_44
action_135 (62) = happyShift action_45
action_135 (67) = happyShift action_46
action_135 (76) = happyShift action_47
action_135 (77) = happyShift action_48
action_135 (9) = happyGoto action_24
action_135 (21) = happyGoto action_156
action_135 (23) = happyGoto action_26
action_135 (24) = happyGoto action_27
action_135 (25) = happyGoto action_28
action_135 (26) = happyGoto action_29
action_135 (27) = happyGoto action_30
action_135 (28) = happyGoto action_31
action_135 (30) = happyGoto action_32
action_135 (32) = happyGoto action_33
action_135 (34) = happyGoto action_34
action_135 (36) = happyGoto action_35
action_135 (38) = happyGoto action_36
action_135 (39) = happyGoto action_37
action_135 (40) = happyGoto action_38
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (50) = happyShift action_111
action_136 (51) = happyShift action_112
action_136 (52) = happyShift action_113
action_136 (53) = happyShift action_114
action_136 (54) = happyShift action_115
action_136 (55) = happyShift action_116
action_136 (56) = happyShift action_117
action_136 (57) = happyShift action_118
action_136 (58) = happyShift action_119
action_136 (59) = happyShift action_120
action_136 (86) = happyShift action_121
action_136 (22) = happyGoto action_155
action_136 _ = happyReduce_96

action_137 (47) = happyShift action_133
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_14

action_139 (42) = happyShift action_7
action_139 (8) = happyGoto action_153
action_139 (12) = happyGoto action_154
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_29

action_141 (41) = happyShift action_39
action_141 (42) = happyShift action_15
action_141 (43) = happyShift action_40
action_141 (44) = happyShift action_41
action_141 (45) = happyShift action_42
action_141 (60) = happyShift action_43
action_141 (61) = happyShift action_44
action_141 (62) = happyShift action_45
action_141 (67) = happyShift action_46
action_141 (76) = happyShift action_47
action_141 (77) = happyShift action_48
action_141 (9) = happyGoto action_24
action_141 (21) = happyGoto action_152
action_141 (23) = happyGoto action_26
action_141 (24) = happyGoto action_27
action_141 (25) = happyGoto action_28
action_141 (26) = happyGoto action_29
action_141 (27) = happyGoto action_30
action_141 (28) = happyGoto action_31
action_141 (30) = happyGoto action_32
action_141 (32) = happyGoto action_33
action_141 (34) = happyGoto action_34
action_141 (36) = happyGoto action_35
action_141 (38) = happyGoto action_36
action_141 (39) = happyGoto action_37
action_141 (40) = happyGoto action_38
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (41) = happyShift action_39
action_142 (42) = happyShift action_15
action_142 (43) = happyShift action_40
action_142 (44) = happyShift action_41
action_142 (45) = happyShift action_42
action_142 (60) = happyShift action_43
action_142 (61) = happyShift action_44
action_142 (62) = happyShift action_45
action_142 (67) = happyShift action_46
action_142 (76) = happyShift action_47
action_142 (77) = happyShift action_48
action_142 (9) = happyGoto action_24
action_142 (21) = happyGoto action_151
action_142 (23) = happyGoto action_26
action_142 (24) = happyGoto action_27
action_142 (25) = happyGoto action_28
action_142 (26) = happyGoto action_29
action_142 (27) = happyGoto action_30
action_142 (28) = happyGoto action_31
action_142 (30) = happyGoto action_32
action_142 (32) = happyGoto action_33
action_142 (34) = happyGoto action_34
action_142 (36) = happyGoto action_35
action_142 (38) = happyGoto action_36
action_142 (39) = happyGoto action_37
action_142 (40) = happyGoto action_38
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (41) = happyShift action_39
action_143 (42) = happyShift action_64
action_143 (43) = happyShift action_40
action_143 (44) = happyShift action_41
action_143 (45) = happyShift action_42
action_143 (60) = happyShift action_43
action_143 (61) = happyShift action_44
action_143 (62) = happyShift action_45
action_143 (67) = happyShift action_46
action_143 (76) = happyShift action_47
action_143 (77) = happyShift action_48
action_143 (83) = happyShift action_69
action_143 (8) = happyGoto action_148
action_143 (9) = happyGoto action_149
action_143 (20) = happyGoto action_150
action_143 (21) = happyGoto action_63
action_143 (23) = happyGoto action_26
action_143 (24) = happyGoto action_27
action_143 (25) = happyGoto action_28
action_143 (26) = happyGoto action_29
action_143 (27) = happyGoto action_30
action_143 (28) = happyGoto action_31
action_143 (30) = happyGoto action_32
action_143 (32) = happyGoto action_33
action_143 (34) = happyGoto action_34
action_143 (36) = happyGoto action_35
action_143 (38) = happyGoto action_36
action_143 (39) = happyGoto action_37
action_143 (40) = happyGoto action_38
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_40

action_145 _ = happyReduce_21

action_146 _ = happyReduce_18

action_147 (83) = happyShift action_18
action_147 (86) = happyShift action_19
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (41) = happyShift action_39
action_148 (42) = happyShift action_15
action_148 (43) = happyShift action_40
action_148 (44) = happyShift action_41
action_148 (45) = happyShift action_42
action_148 (60) = happyShift action_43
action_148 (61) = happyShift action_44
action_148 (62) = happyShift action_45
action_148 (67) = happyShift action_46
action_148 (76) = happyShift action_47
action_148 (77) = happyShift action_48
action_148 (83) = happyShift action_69
action_148 (9) = happyGoto action_165
action_148 (20) = happyGoto action_166
action_148 (21) = happyGoto action_63
action_148 (23) = happyGoto action_26
action_148 (24) = happyGoto action_27
action_148 (25) = happyGoto action_28
action_148 (26) = happyGoto action_29
action_148 (27) = happyGoto action_30
action_148 (28) = happyGoto action_31
action_148 (30) = happyGoto action_32
action_148 (32) = happyGoto action_33
action_148 (34) = happyGoto action_34
action_148 (36) = happyGoto action_35
action_148 (38) = happyGoto action_36
action_148 (39) = happyGoto action_37
action_148 (40) = happyGoto action_38
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (50) = happyShift action_111
action_149 (51) = happyShift action_112
action_149 (52) = happyShift action_113
action_149 (53) = happyShift action_114
action_149 (54) = happyShift action_115
action_149 (55) = happyShift action_116
action_149 (56) = happyShift action_117
action_149 (57) = happyShift action_118
action_149 (58) = happyShift action_119
action_149 (59) = happyShift action_120
action_149 (60) = happyReduce_96
action_149 (61) = happyReduce_96
action_149 (86) = happyShift action_121
action_149 (90) = happyShift action_164
action_149 (22) = happyGoto action_110
action_149 _ = happyReduce_99

action_150 (41) = happyShift action_39
action_150 (42) = happyShift action_15
action_150 (43) = happyShift action_40
action_150 (44) = happyShift action_41
action_150 (45) = happyShift action_42
action_150 (60) = happyShift action_43
action_150 (61) = happyShift action_44
action_150 (62) = happyShift action_45
action_150 (67) = happyShift action_46
action_150 (76) = happyShift action_47
action_150 (77) = happyShift action_48
action_150 (83) = happyShift action_69
action_150 (9) = happyGoto action_24
action_150 (20) = happyGoto action_163
action_150 (21) = happyGoto action_63
action_150 (23) = happyGoto action_26
action_150 (24) = happyGoto action_27
action_150 (25) = happyGoto action_28
action_150 (26) = happyGoto action_29
action_150 (27) = happyGoto action_30
action_150 (28) = happyGoto action_31
action_150 (30) = happyGoto action_32
action_150 (32) = happyGoto action_33
action_150 (34) = happyGoto action_34
action_150 (36) = happyGoto action_35
action_150 (38) = happyGoto action_36
action_150 (39) = happyGoto action_37
action_150 (40) = happyGoto action_38
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (47) = happyShift action_162
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (47) = happyShift action_161
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (42) = happyShift action_15
action_153 (9) = happyGoto action_160
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (47) = happyShift action_159
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (41) = happyShift action_39
action_155 (42) = happyShift action_15
action_155 (43) = happyShift action_40
action_155 (44) = happyShift action_41
action_155 (45) = happyShift action_42
action_155 (60) = happyShift action_43
action_155 (61) = happyShift action_44
action_155 (62) = happyShift action_45
action_155 (67) = happyShift action_46
action_155 (76) = happyShift action_47
action_155 (77) = happyShift action_48
action_155 (9) = happyGoto action_24
action_155 (21) = happyGoto action_158
action_155 (23) = happyGoto action_26
action_155 (24) = happyGoto action_27
action_155 (25) = happyGoto action_28
action_155 (26) = happyGoto action_29
action_155 (27) = happyGoto action_30
action_155 (28) = happyGoto action_31
action_155 (30) = happyGoto action_32
action_155 (32) = happyGoto action_33
action_155 (34) = happyGoto action_34
action_155 (36) = happyGoto action_35
action_155 (38) = happyGoto action_36
action_155 (39) = happyGoto action_37
action_155 (40) = happyGoto action_38
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (47) = happyShift action_157
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_97

action_158 (47) = happyShift action_157
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_15

action_160 (84) = happyShift action_174
action_160 _ = happyReduce_16

action_161 (87) = happyShift action_52
action_161 (13) = happyGoto action_173
action_161 _ = happyFail (happyExpListPerState 161)

action_162 (87) = happyShift action_52
action_162 (13) = happyGoto action_172
action_162 _ = happyFail (happyExpListPerState 162)

action_163 (41) = happyShift action_39
action_163 (42) = happyShift action_15
action_163 (43) = happyShift action_40
action_163 (44) = happyShift action_41
action_163 (45) = happyShift action_42
action_163 (47) = happyShift action_171
action_163 (60) = happyShift action_43
action_163 (61) = happyShift action_44
action_163 (62) = happyShift action_45
action_163 (67) = happyShift action_46
action_163 (76) = happyShift action_47
action_163 (77) = happyShift action_48
action_163 (9) = happyGoto action_24
action_163 (21) = happyGoto action_170
action_163 (23) = happyGoto action_26
action_163 (24) = happyGoto action_27
action_163 (25) = happyGoto action_28
action_163 (26) = happyGoto action_29
action_163 (27) = happyGoto action_30
action_163 (28) = happyGoto action_31
action_163 (30) = happyGoto action_32
action_163 (32) = happyGoto action_33
action_163 (34) = happyGoto action_34
action_163 (36) = happyGoto action_35
action_163 (38) = happyGoto action_36
action_163 (39) = happyGoto action_37
action_163 (40) = happyGoto action_38
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (42) = happyShift action_15
action_164 (9) = happyGoto action_169
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (50) = happyShift action_111
action_165 (51) = happyShift action_112
action_165 (52) = happyShift action_113
action_165 (53) = happyShift action_114
action_165 (54) = happyShift action_115
action_165 (55) = happyShift action_116
action_165 (56) = happyShift action_117
action_165 (57) = happyShift action_118
action_165 (58) = happyShift action_119
action_165 (59) = happyShift action_120
action_165 (60) = happyReduce_96
action_165 (61) = happyReduce_96
action_165 (86) = happyShift action_121
action_165 (90) = happyShift action_168
action_165 (22) = happyGoto action_110
action_165 _ = happyReduce_99

action_166 (41) = happyShift action_39
action_166 (42) = happyShift action_15
action_166 (43) = happyShift action_40
action_166 (44) = happyShift action_41
action_166 (45) = happyShift action_42
action_166 (60) = happyShift action_43
action_166 (61) = happyShift action_44
action_166 (62) = happyShift action_45
action_166 (67) = happyShift action_46
action_166 (76) = happyShift action_47
action_166 (77) = happyShift action_48
action_166 (83) = happyShift action_69
action_166 (9) = happyGoto action_24
action_166 (20) = happyGoto action_167
action_166 (21) = happyGoto action_63
action_166 (23) = happyGoto action_26
action_166 (24) = happyGoto action_27
action_166 (25) = happyGoto action_28
action_166 (26) = happyGoto action_29
action_166 (27) = happyGoto action_30
action_166 (28) = happyGoto action_31
action_166 (30) = happyGoto action_32
action_166 (32) = happyGoto action_33
action_166 (34) = happyGoto action_34
action_166 (36) = happyGoto action_35
action_166 (38) = happyGoto action_36
action_166 (39) = happyGoto action_37
action_166 (40) = happyGoto action_38
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (41) = happyShift action_39
action_167 (42) = happyShift action_15
action_167 (43) = happyShift action_40
action_167 (44) = happyShift action_41
action_167 (45) = happyShift action_42
action_167 (47) = happyShift action_182
action_167 (60) = happyShift action_43
action_167 (61) = happyShift action_44
action_167 (62) = happyShift action_45
action_167 (67) = happyShift action_46
action_167 (76) = happyShift action_47
action_167 (77) = happyShift action_48
action_167 (9) = happyGoto action_24
action_167 (21) = happyGoto action_181
action_167 (23) = happyGoto action_26
action_167 (24) = happyGoto action_27
action_167 (25) = happyGoto action_28
action_167 (26) = happyGoto action_29
action_167 (27) = happyGoto action_30
action_167 (28) = happyGoto action_31
action_167 (30) = happyGoto action_32
action_167 (32) = happyGoto action_33
action_167 (34) = happyGoto action_34
action_167 (36) = happyGoto action_35
action_167 (38) = happyGoto action_36
action_167 (39) = happyGoto action_37
action_167 (40) = happyGoto action_38
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (42) = happyShift action_15
action_168 (9) = happyGoto action_180
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (47) = happyShift action_179
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (47) = happyShift action_178
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (87) = happyShift action_52
action_171 (13) = happyGoto action_177
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (81) = happyShift action_176
action_172 _ = happyReduce_30

action_173 _ = happyReduce_38

action_174 (42) = happyShift action_7
action_174 (8) = happyGoto action_153
action_174 (12) = happyGoto action_175
action_174 _ = happyFail (happyExpListPerState 174)

action_175 _ = happyReduce_17

action_176 (87) = happyShift action_52
action_176 (13) = happyGoto action_188
action_176 _ = happyFail (happyExpListPerState 176)

action_177 _ = happyReduce_34

action_178 (87) = happyShift action_52
action_178 (13) = happyGoto action_187
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (87) = happyShift action_52
action_179 (13) = happyGoto action_186
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (47) = happyShift action_185
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (47) = happyShift action_184
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (87) = happyShift action_52
action_182 (13) = happyGoto action_183
action_182 _ = happyFail (happyExpListPerState 182)

action_183 _ = happyReduce_32

action_184 (87) = happyShift action_52
action_184 (13) = happyGoto action_190
action_184 _ = happyFail (happyExpListPerState 184)

action_185 (87) = happyShift action_52
action_185 (13) = happyGoto action_189
action_185 _ = happyFail (happyExpListPerState 185)

action_186 _ = happyReduce_36

action_187 _ = happyReduce_35

action_188 _ = happyReduce_31

action_189 _ = happyReduce_37

action_190 _ = happyReduce_33

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Final happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Other happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Inc happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn5
		 (Func happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (Var happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happyReduce 4 6 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Quotes happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Brackets happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Default happy_var_1 (WithOutAssig (SingleExpr (VarAtom happy_var_2)))
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 5 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Default happy_var_1 (SimpleAssig As happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn8
		 (SimpleType happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn9
		 (Name happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 10 happyReduction_12
happyReduction_12 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Fun happy_var_1 happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn11
		 (Zero
	)

happyReduce_14 = happyReduce 4 11 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (One happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 6 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (More happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  12 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 (One happy_var_1 happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 12 happyReduction_17
happyReduction_17 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (More happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  13 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Par happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  13 happyReduction_19
happyReduction_19 _
	_
	 =  HappyAbsSyn13
		 (EmptyBlock
	)

happyReduce_20 = happySpecReduce_1  14 happyReduction_20
happyReduction_20 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (SinglePart happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  14 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (MultipleLines happy_var_1 happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  15 happyReduction_22
happyReduction_22 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn15
		 (Assignment happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  15 happyReduction_23
happyReduction_23 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn15
		 (ForLoop happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  15 happyReduction_24
happyReduction_24 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn15
		 (WhileLoop happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  15 happyReduction_25
happyReduction_25 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn15
		 (Conditional happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  15 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn15
		 (Inits happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (Part happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  16 happyReduction_29
happyReduction_29 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Return happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 17 happyReduction_30
happyReduction_30 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (StandartIf happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 7 17 happyReduction_31
happyReduction_31 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 7 18 happyReduction_32
happyReduction_32 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_5) `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (IterType happy_var_3 happy_var_4 happy_var_5 EmptyTerm happy_var_7
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 8 18 happyReduction_33
happyReduction_33 ((HappyAbsSyn13  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_6) `HappyStk`
	(HappyAbsSyn20  happy_var_5) `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (IterType happy_var_3 happy_var_4 happy_var_5 (NotEmpty happy_var_6) happy_var_8
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 6 18 happyReduction_34
happyReduction_34 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Iter happy_var_3 happy_var_4 EmptyTerm happy_var_6
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 7 18 happyReduction_35
happyReduction_35 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Iter happy_var_3 happy_var_4 (NotEmpty happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 7 18 happyReduction_36
happyReduction_36 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (ForEach happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 8 18 happyReduction_37
happyReduction_37 ((HappyAbsSyn13  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (ForEachType happy_var_3 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 5 19 happyReduction_38
happyReduction_38 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (StandartWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_1  20 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn20
		 (EmptyTerm
	)

happyReduce_40 = happySpecReduce_2  20 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (NotEmpty happy_var_1
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  21 happyReduction_41
happyReduction_41 (HappyAbsSyn21  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn21
		 (SimpleAssig happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  21 happyReduction_42
happyReduction_42 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn21
		 (WithOutAssig  happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  22 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn22
		 (PlusEq
	)

happyReduce_44 = happySpecReduce_1  22 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn22
		 (SubEq
	)

happyReduce_45 = happySpecReduce_1  22 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn22
		 (MulEq
	)

happyReduce_46 = happySpecReduce_1  22 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn22
		 (DivEq
	)

happyReduce_47 = happySpecReduce_1  22 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn22
		 (EucDivEq
	)

happyReduce_48 = happySpecReduce_1  22 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn22
		 (LShiftEq
	)

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (RShiftEq
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn22
		 (OrEq
	)

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn22
		 (AndEq
	)

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn22
		 (XorEq
	)

happyReduce_53 = happySpecReduce_1  22 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn22
		 (As
	)

happyReduce_54 = happySpecReduce_3  23 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (BinaryExpr Or happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  24 happyReduction_56
happyReduction_56 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (BinaryExpr And happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  25 happyReduction_58
happyReduction_58 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (BinaryExpr BitOr happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  25 happyReduction_59
happyReduction_59 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  26 happyReduction_60
happyReduction_60 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinaryExpr BitXor happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  26 happyReduction_61
happyReduction_61 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  27 happyReduction_62
happyReduction_62 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (BinaryExpr BitAnd happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  27 happyReduction_63
happyReduction_63 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  28 happyReduction_64
happyReduction_64 (HappyAbsSyn28  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn28
		 (BinaryExpr happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  28 happyReduction_65
happyReduction_65 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  29 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn29
		 (Eq
	)

happyReduce_67 = happySpecReduce_1  29 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn29
		 (NotEq
	)

happyReduce_68 = happySpecReduce_3  30 happyReduction_68
happyReduction_68 (HappyAbsSyn30  happy_var_3)
	(HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 (BinaryExpr happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  30 happyReduction_69
happyReduction_69 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  31 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn31
		 (Lt
	)

happyReduce_71 = happySpecReduce_1  31 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn31
		 (Gt
	)

happyReduce_72 = happySpecReduce_1  31 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn31
		 (Lte
	)

happyReduce_73 = happySpecReduce_1  31 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn31
		 (Gte
	)

happyReduce_74 = happySpecReduce_3  32 happyReduction_74
happyReduction_74 (HappyAbsSyn32  happy_var_3)
	(HappyAbsSyn33  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn32
		 (BinaryExpr happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  32 happyReduction_75
happyReduction_75 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  33 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn33
		 (RShift
	)

happyReduce_77 = happySpecReduce_1  33 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn33
		 (LShift
	)

happyReduce_78 = happySpecReduce_3  34 happyReduction_78
happyReduction_78 (HappyAbsSyn34  happy_var_3)
	(HappyAbsSyn35  happy_var_2)
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 (BinaryExpr happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  34 happyReduction_79
happyReduction_79 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  35 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn35
		 (Add
	)

happyReduce_81 = happySpecReduce_1  35 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn35
		 (Sub
	)

happyReduce_82 = happySpecReduce_3  36 happyReduction_82
happyReduction_82 (HappyAbsSyn36  happy_var_3)
	(HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn36
		 (BinaryExpr happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_1  36 happyReduction_83
happyReduction_83 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_1  37 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn37
		 (Mul
	)

happyReduce_85 = happySpecReduce_1  37 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn37
		 (Div
	)

happyReduce_86 = happySpecReduce_1  37 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn37
		 (EucDiv
	)

happyReduce_87 = happySpecReduce_2  38 happyReduction_87
happyReduction_87 (HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr PPPref  (SingleExpr happy_var_2)
	)
happyReduction_87 _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_2  38 happyReduction_88
happyReduction_88 (HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr MMPref  (SingleExpr happy_var_2)
	)
happyReduction_88 _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_2  38 happyReduction_89
happyReduction_89 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr Pos happy_var_2
	)
happyReduction_89 _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_2  38 happyReduction_90
happyReduction_90 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr Neg happy_var_2
	)
happyReduction_90 _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_2  38 happyReduction_91
happyReduction_91 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr Not happy_var_2
	)
happyReduction_91 _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_2  38 happyReduction_92
happyReduction_92 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr Inv happy_var_2
	)
happyReduction_92 _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_2  38 happyReduction_93
happyReduction_93 _
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn38
		 (UnaryExpr PPSuff (SingleExpr happy_var_1)
	)
happyReduction_93 _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_2  38 happyReduction_94
happyReduction_94 _
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn38
		 (UnaryExpr MMSuff (SingleExpr happy_var_1)
	)
happyReduction_94 _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_1  38 happyReduction_95
happyReduction_95 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn38
		 (SingleExpr happy_var_1
	)
happyReduction_95 _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_1  39 happyReduction_96
happyReduction_96 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn39
		 (VarAtom happy_var_1
	)
happyReduction_96 _  = notHappyAtAll 

happyReduce_97 = happyReduce 5 39 happyReduction_97
happyReduction_97 (_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprPar (SimpleAssig happy_var_3 happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_98 = happySpecReduce_3  39 happyReduction_98
happyReduction_98 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn39
		 (ExprPar (WithOutAssig (SingleExpr happy_var_2))
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_1  40 happyReduction_99
happyReduction_99 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn40
		 (VarAtom happy_var_1
	)
happyReduction_99 _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_1  40 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn40
		 (T
	)

happyReduce_101 = happySpecReduce_1  40 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn40
		 (F
	)

happyReduce_102 = happySpecReduce_1  40 happyReduction_102
happyReduction_102 (HappyTerminal (Number happy_var_1))
	 =  HappyAbsSyn40
		 (VarAtom (Name happy_var_1)
	)
happyReduction_102 _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  40 happyReduction_103
happyReduction_103 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (ExprPar happy_var_2
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 92 92 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Number happy_dollar_dollar -> cont 41;
	Identifier happy_dollar_dollar -> cont 42;
	MinusT -> cont 43;
	PlusT -> cont 44;
	LeftP -> cont 45;
	MulT -> cont 46;
	RightP -> cont 47;
	DivT -> cont 48;
	EucDivT -> cont 49;
	PlusEqT -> cont 50;
	SubEqT -> cont 51;
	MulEqT -> cont 52;
	DivEqT -> cont 53;
	EucDivEqT -> cont 54;
	RShiftEqT -> cont 55;
	LShiftEqT -> cont 56;
	AndEqT -> cont 57;
	OrEqT -> cont 58;
	XorEqT -> cont 59;
	PPT -> cont 60;
	MMT -> cont 61;
	InvT -> cont 62;
	OrT -> cont 63;
	AndT -> cont 64;
	RShiftT -> cont 65;
	LShiftT -> cont 66;
	NotT -> cont 67;
	AndAndT -> cont 68;
	OrOrT -> cont 69;
	EqT -> cont 70;
	NotEqT -> cont 71;
	GTT -> cont 72;
	LTT -> cont 73;
	GTET -> cont 74;
	LTET -> cont 75;
	TrueT -> cont 76;
	FalseT -> cont 77;
	ForT -> cont 78;
	IfT -> cont 79;
	WhileT -> cont 80;
	ElseT -> cont 81;
	ReturnT -> cont 82;
	SemiT -> cont 83;
	CommaT -> cont 84;
	IncludeT -> cont 85;
	AsT -> cont 86;
	LParT -> cont 87;
	RParT -> cont 88;
	QuotesT -> cont 89;
	ColonT -> cont 90;
	XorT -> cont 91;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 92 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Either String a -> (a -> Either String b) -> Either String b
happyThen = (>>=)
happyReturn :: () => a -> Either String a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Either String a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> Either String a
happyError' = (\(tokens, _) -> parseError tokens)
parseExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError = fail "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
