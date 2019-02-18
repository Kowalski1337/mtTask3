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
happyExpList = Happy_Data_Array.listArray (0,753) ([0,0,512,0,0,4,0,0,8,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,64,0,0,0,0,0,0,0,8192,0,0,64,0,0,0,0,0,0,0,0,2,0,0,0,0,2048,0,0,0,0,0,256,0,36864,0,0,0,0,0,0,0,0,0,0,0,16,0,0,264,0,0,0,0,0,0,0,0,0,0,1984,16896,384,0,0,0,0,0,16384,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2046,0,8,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,512,0,0,0,0,16384,0,0,0,0,0,0,0,16,0,0,0,8,0,0,0,0,0,24,0,0,0,0,32768,7,0,0,0,0,12,0,0,0,768,0,0,0,0,0,416,0,0,0,0,31744,8192,6148,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,32769,24592,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,32769,57360,795,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,49152,7,32834,1135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,4,0,0,0,0,4096,0,0,0,0,0,64,0,0,0,0,61440,32769,24592,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,8,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,124,1056,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31744,8192,6148,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,2048,1537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1984,16896,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,2048,1537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1984,16896,384,0,0,0,31,264,6,0,0,31744,8192,6148,0,0,0,496,4224,96,0,0,49152,7,32834,1,0,0,0,0,0,0,0,0,124,1056,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,31,264,6,0,0,31744,8192,6148,0,0,0,496,4224,4192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,1984,16896,16768,0,0,0,65024,7,34816,0,0,31744,8192,6148,4,0,0,1024,0,0,0,0,0,16,0,0,0,0,512,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,4096,0,0,0,0,0,64,0,0,1520,4224,96,0,0,32768,0,0,0,0,0,0,2046,0,136,0,0,124,1056,1048,0,0,61440,32773,24592,0,0,0,128,0,0,0,0,0,64,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,16,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,1,0,0,16,0,0,0,0,16384,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseExpr","Code","Single","Include","Variable","Type","Name","Function","Args","MoreArgs","Block","Internal","CodeLine","Return","If","For","While","Term","Assig","AssigOp","Expr14","Expr13","Expr12","Expr11","Expr10","Expr9","Op9","Expr8","Op8","Expr7","Op7","Expr6","Op6","Expr5","Op5","Expr3","UnOp","Atom","NUMBER","IDEN","MINUS","PLUS","LEFTP","MUL","RIGHTP","DIV","EUCDIV","PLUSEQ","SUBEQ","MULEQ","DIVEQ","EUCDIVEQ","RSHIFTEQ","LSHIFTEQ","ANDEQ","OREQ","XOREQ","INV","OR","AND","RSHIFT","LSHIFT","NOT","ANDAND","OROR","EQ","NOTEQ","GT","LT","GTE","LTE","TRUE","FALSE","FOR","IF","WHILE","ELSE","RETURN","SEMI","COMMA","INCLUDE","AS","LPAR","RPAR","QUOTES","COLON","XOR","%eof"]
        bit_start = st * 90
        bit_end = (st + 1) * 90
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..89]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (42) = happyShift action_7
action_0 (83) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_10
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (10) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (42) = happyShift action_7
action_1 (83) = happyShift action_8
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

action_8 (71) = happyShift action_12
action_8 (87) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (90) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (42) = happyShift action_7
action_10 (83) = happyShift action_8
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
action_14 (81) = happyShift action_18
action_14 (84) = happyShift action_19
action_14 (11) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_11

action_16 (85) = happyShift action_50
action_16 (13) = happyGoto action_49
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (42) = happyShift action_7
action_17 (47) = happyShift action_48
action_17 (8) = happyGoto action_47
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_8

action_19 (41) = happyShift action_39
action_19 (42) = happyShift action_15
action_19 (43) = happyShift action_40
action_19 (44) = happyShift action_41
action_19 (45) = happyShift action_42
action_19 (60) = happyShift action_43
action_19 (65) = happyShift action_44
action_19 (74) = happyShift action_45
action_19 (75) = happyShift action_46
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

action_20 (87) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (70) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_7

action_23 _ = happyReduce_6

action_24 (50) = happyShift action_98
action_24 (51) = happyShift action_99
action_24 (52) = happyShift action_100
action_24 (53) = happyShift action_101
action_24 (54) = happyShift action_102
action_24 (55) = happyShift action_103
action_24 (56) = happyShift action_104
action_24 (57) = happyShift action_105
action_24 (58) = happyShift action_106
action_24 (59) = happyShift action_107
action_24 (84) = happyShift action_108
action_24 (22) = happyGoto action_97
action_24 _ = happyReduce_93

action_25 (81) = happyShift action_96
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_42

action_27 (67) = happyShift action_95
action_27 _ = happyReduce_55

action_28 (66) = happyShift action_94
action_28 _ = happyReduce_57

action_29 (61) = happyShift action_93
action_29 _ = happyReduce_59

action_30 (89) = happyShift action_92
action_30 _ = happyReduce_61

action_31 (62) = happyShift action_91
action_31 _ = happyReduce_63

action_32 (68) = happyShift action_89
action_32 (69) = happyShift action_90
action_32 (29) = happyGoto action_88
action_32 _ = happyReduce_65

action_33 (70) = happyShift action_84
action_33 (71) = happyShift action_85
action_33 (72) = happyShift action_86
action_33 (73) = happyShift action_87
action_33 (31) = happyGoto action_83
action_33 _ = happyReduce_69

action_34 (63) = happyShift action_81
action_34 (64) = happyShift action_82
action_34 (33) = happyGoto action_80
action_34 _ = happyReduce_75

action_35 (43) = happyShift action_78
action_35 (44) = happyShift action_79
action_35 (35) = happyGoto action_77
action_35 _ = happyReduce_79

action_36 (46) = happyShift action_74
action_36 (48) = happyShift action_75
action_36 (49) = happyShift action_76
action_36 (37) = happyGoto action_73
action_36 _ = happyReduce_83

action_37 (41) = happyShift action_39
action_37 (42) = happyShift action_15
action_37 (43) = happyShift action_40
action_37 (44) = happyShift action_41
action_37 (45) = happyShift action_42
action_37 (60) = happyShift action_43
action_37 (65) = happyShift action_44
action_37 (74) = happyShift action_45
action_37 (75) = happyShift action_46
action_37 (9) = happyGoto action_71
action_37 (38) = happyGoto action_72
action_37 (39) = happyGoto action_37
action_37 (40) = happyGoto action_38
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_88

action_39 _ = happyReduce_96

action_40 _ = happyReduce_90

action_41 _ = happyReduce_89

action_42 (41) = happyShift action_39
action_42 (42) = happyShift action_15
action_42 (43) = happyShift action_40
action_42 (44) = happyShift action_41
action_42 (45) = happyShift action_42
action_42 (60) = happyShift action_43
action_42 (65) = happyShift action_44
action_42 (74) = happyShift action_45
action_42 (75) = happyShift action_46
action_42 (9) = happyGoto action_24
action_42 (21) = happyGoto action_70
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
action_42 (39) = happyGoto action_37
action_42 (40) = happyGoto action_38
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_92

action_44 _ = happyReduce_91

action_45 _ = happyReduce_94

action_46 _ = happyReduce_95

action_47 (42) = happyShift action_15
action_47 (9) = happyGoto action_69
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_13

action_49 _ = happyReduce_12

action_50 (41) = happyShift action_39
action_50 (42) = happyShift action_62
action_50 (43) = happyShift action_40
action_50 (44) = happyShift action_41
action_50 (45) = happyShift action_42
action_50 (60) = happyShift action_43
action_50 (65) = happyShift action_44
action_50 (74) = happyShift action_45
action_50 (75) = happyShift action_46
action_50 (76) = happyShift action_63
action_50 (77) = happyShift action_64
action_50 (78) = happyShift action_65
action_50 (80) = happyShift action_66
action_50 (81) = happyShift action_67
action_50 (85) = happyShift action_50
action_50 (86) = happyShift action_68
action_50 (7) = happyGoto action_51
action_50 (8) = happyGoto action_52
action_50 (9) = happyGoto action_24
action_50 (13) = happyGoto action_53
action_50 (14) = happyGoto action_54
action_50 (15) = happyGoto action_55
action_50 (16) = happyGoto action_56
action_50 (17) = happyGoto action_57
action_50 (18) = happyGoto action_58
action_50 (19) = happyGoto action_59
action_50 (20) = happyGoto action_60
action_50 (21) = happyGoto action_61
action_50 (23) = happyGoto action_26
action_50 (24) = happyGoto action_27
action_50 (25) = happyGoto action_28
action_50 (26) = happyGoto action_29
action_50 (27) = happyGoto action_30
action_50 (28) = happyGoto action_31
action_50 (30) = happyGoto action_32
action_50 (32) = happyGoto action_33
action_50 (34) = happyGoto action_34
action_50 (36) = happyGoto action_35
action_50 (38) = happyGoto action_36
action_50 (39) = happyGoto action_37
action_50 (40) = happyGoto action_38
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_26

action_52 (42) = happyShift action_15
action_52 (9) = happyGoto action_130
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_27

action_54 (86) = happyShift action_129
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (41) = happyShift action_39
action_55 (42) = happyShift action_62
action_55 (43) = happyShift action_40
action_55 (44) = happyShift action_41
action_55 (45) = happyShift action_42
action_55 (60) = happyShift action_43
action_55 (65) = happyShift action_44
action_55 (74) = happyShift action_45
action_55 (75) = happyShift action_46
action_55 (76) = happyShift action_63
action_55 (77) = happyShift action_64
action_55 (78) = happyShift action_65
action_55 (80) = happyShift action_66
action_55 (81) = happyShift action_67
action_55 (85) = happyShift action_50
action_55 (7) = happyGoto action_51
action_55 (8) = happyGoto action_52
action_55 (9) = happyGoto action_24
action_55 (13) = happyGoto action_53
action_55 (14) = happyGoto action_128
action_55 (15) = happyGoto action_55
action_55 (16) = happyGoto action_56
action_55 (17) = happyGoto action_57
action_55 (18) = happyGoto action_58
action_55 (19) = happyGoto action_59
action_55 (20) = happyGoto action_60
action_55 (21) = happyGoto action_61
action_55 (23) = happyGoto action_26
action_55 (24) = happyGoto action_27
action_55 (25) = happyGoto action_28
action_55 (26) = happyGoto action_29
action_55 (27) = happyGoto action_30
action_55 (28) = happyGoto action_31
action_55 (30) = happyGoto action_32
action_55 (32) = happyGoto action_33
action_55 (34) = happyGoto action_34
action_55 (36) = happyGoto action_35
action_55 (38) = happyGoto action_36
action_55 (39) = happyGoto action_37
action_55 (40) = happyGoto action_38
action_55 _ = happyReduce_20

action_56 _ = happyReduce_28

action_57 _ = happyReduce_25

action_58 _ = happyReduce_23

action_59 _ = happyReduce_24

action_60 _ = happyReduce_22

action_61 (81) = happyShift action_127
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (43) = happyReduce_11
action_62 (44) = happyReduce_11
action_62 (46) = happyReduce_11
action_62 (48) = happyReduce_11
action_62 (49) = happyReduce_11
action_62 (50) = happyReduce_11
action_62 (51) = happyReduce_11
action_62 (52) = happyReduce_11
action_62 (53) = happyReduce_11
action_62 (54) = happyReduce_11
action_62 (55) = happyReduce_11
action_62 (56) = happyReduce_11
action_62 (57) = happyReduce_11
action_62 (58) = happyReduce_11
action_62 (59) = happyReduce_11
action_62 (61) = happyReduce_11
action_62 (62) = happyReduce_11
action_62 (63) = happyReduce_11
action_62 (64) = happyReduce_11
action_62 (66) = happyReduce_11
action_62 (67) = happyReduce_11
action_62 (68) = happyReduce_11
action_62 (69) = happyReduce_11
action_62 (70) = happyReduce_11
action_62 (71) = happyReduce_11
action_62 (72) = happyReduce_11
action_62 (73) = happyReduce_11
action_62 (81) = happyReduce_11
action_62 (84) = happyReduce_11
action_62 (88) = happyReduce_11
action_62 (89) = happyReduce_11
action_62 _ = happyReduce_10

action_63 (45) = happyShift action_126
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (45) = happyShift action_125
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (45) = happyShift action_124
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (41) = happyShift action_39
action_66 (42) = happyShift action_15
action_66 (43) = happyShift action_40
action_66 (44) = happyShift action_41
action_66 (45) = happyShift action_42
action_66 (60) = happyShift action_43
action_66 (65) = happyShift action_44
action_66 (74) = happyShift action_45
action_66 (75) = happyShift action_46
action_66 (81) = happyShift action_67
action_66 (9) = happyGoto action_24
action_66 (20) = happyGoto action_123
action_66 (21) = happyGoto action_61
action_66 (23) = happyGoto action_26
action_66 (24) = happyGoto action_27
action_66 (25) = happyGoto action_28
action_66 (26) = happyGoto action_29
action_66 (27) = happyGoto action_30
action_66 (28) = happyGoto action_31
action_66 (30) = happyGoto action_32
action_66 (32) = happyGoto action_33
action_66 (34) = happyGoto action_34
action_66 (36) = happyGoto action_35
action_66 (38) = happyGoto action_36
action_66 (39) = happyGoto action_37
action_66 (40) = happyGoto action_38
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_39

action_68 _ = happyReduce_19

action_69 (47) = happyShift action_121
action_69 (82) = happyShift action_122
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (47) = happyShift action_120
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_93

action_72 _ = happyReduce_87

action_73 (41) = happyShift action_39
action_73 (42) = happyShift action_15
action_73 (43) = happyShift action_40
action_73 (44) = happyShift action_41
action_73 (45) = happyShift action_42
action_73 (60) = happyShift action_43
action_73 (65) = happyShift action_44
action_73 (74) = happyShift action_45
action_73 (75) = happyShift action_46
action_73 (9) = happyGoto action_71
action_73 (36) = happyGoto action_119
action_73 (38) = happyGoto action_36
action_73 (39) = happyGoto action_37
action_73 (40) = happyGoto action_38
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_84

action_75 _ = happyReduce_85

action_76 _ = happyReduce_86

action_77 (41) = happyShift action_39
action_77 (42) = happyShift action_15
action_77 (43) = happyShift action_40
action_77 (44) = happyShift action_41
action_77 (45) = happyShift action_42
action_77 (60) = happyShift action_43
action_77 (65) = happyShift action_44
action_77 (74) = happyShift action_45
action_77 (75) = happyShift action_46
action_77 (9) = happyGoto action_71
action_77 (34) = happyGoto action_118
action_77 (36) = happyGoto action_35
action_77 (38) = happyGoto action_36
action_77 (39) = happyGoto action_37
action_77 (40) = happyGoto action_38
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_81

action_79 _ = happyReduce_80

action_80 (41) = happyShift action_39
action_80 (42) = happyShift action_15
action_80 (43) = happyShift action_40
action_80 (44) = happyShift action_41
action_80 (45) = happyShift action_42
action_80 (60) = happyShift action_43
action_80 (65) = happyShift action_44
action_80 (74) = happyShift action_45
action_80 (75) = happyShift action_46
action_80 (9) = happyGoto action_71
action_80 (32) = happyGoto action_117
action_80 (34) = happyGoto action_34
action_80 (36) = happyGoto action_35
action_80 (38) = happyGoto action_36
action_80 (39) = happyGoto action_37
action_80 (40) = happyGoto action_38
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_76

action_82 _ = happyReduce_77

action_83 (41) = happyShift action_39
action_83 (42) = happyShift action_15
action_83 (43) = happyShift action_40
action_83 (44) = happyShift action_41
action_83 (45) = happyShift action_42
action_83 (60) = happyShift action_43
action_83 (65) = happyShift action_44
action_83 (74) = happyShift action_45
action_83 (75) = happyShift action_46
action_83 (9) = happyGoto action_71
action_83 (30) = happyGoto action_116
action_83 (32) = happyGoto action_33
action_83 (34) = happyGoto action_34
action_83 (36) = happyGoto action_35
action_83 (38) = happyGoto action_36
action_83 (39) = happyGoto action_37
action_83 (40) = happyGoto action_38
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_71

action_85 _ = happyReduce_70

action_86 _ = happyReduce_73

action_87 _ = happyReduce_72

action_88 (41) = happyShift action_39
action_88 (42) = happyShift action_15
action_88 (43) = happyShift action_40
action_88 (44) = happyShift action_41
action_88 (45) = happyShift action_42
action_88 (60) = happyShift action_43
action_88 (65) = happyShift action_44
action_88 (74) = happyShift action_45
action_88 (75) = happyShift action_46
action_88 (9) = happyGoto action_71
action_88 (28) = happyGoto action_115
action_88 (30) = happyGoto action_32
action_88 (32) = happyGoto action_33
action_88 (34) = happyGoto action_34
action_88 (36) = happyGoto action_35
action_88 (38) = happyGoto action_36
action_88 (39) = happyGoto action_37
action_88 (40) = happyGoto action_38
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_66

action_90 _ = happyReduce_67

action_91 (41) = happyShift action_39
action_91 (42) = happyShift action_15
action_91 (43) = happyShift action_40
action_91 (44) = happyShift action_41
action_91 (45) = happyShift action_42
action_91 (60) = happyShift action_43
action_91 (65) = happyShift action_44
action_91 (74) = happyShift action_45
action_91 (75) = happyShift action_46
action_91 (9) = happyGoto action_71
action_91 (27) = happyGoto action_114
action_91 (28) = happyGoto action_31
action_91 (30) = happyGoto action_32
action_91 (32) = happyGoto action_33
action_91 (34) = happyGoto action_34
action_91 (36) = happyGoto action_35
action_91 (38) = happyGoto action_36
action_91 (39) = happyGoto action_37
action_91 (40) = happyGoto action_38
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (41) = happyShift action_39
action_92 (42) = happyShift action_15
action_92 (43) = happyShift action_40
action_92 (44) = happyShift action_41
action_92 (45) = happyShift action_42
action_92 (60) = happyShift action_43
action_92 (65) = happyShift action_44
action_92 (74) = happyShift action_45
action_92 (75) = happyShift action_46
action_92 (9) = happyGoto action_71
action_92 (26) = happyGoto action_113
action_92 (27) = happyGoto action_30
action_92 (28) = happyGoto action_31
action_92 (30) = happyGoto action_32
action_92 (32) = happyGoto action_33
action_92 (34) = happyGoto action_34
action_92 (36) = happyGoto action_35
action_92 (38) = happyGoto action_36
action_92 (39) = happyGoto action_37
action_92 (40) = happyGoto action_38
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (41) = happyShift action_39
action_93 (42) = happyShift action_15
action_93 (43) = happyShift action_40
action_93 (44) = happyShift action_41
action_93 (45) = happyShift action_42
action_93 (60) = happyShift action_43
action_93 (65) = happyShift action_44
action_93 (74) = happyShift action_45
action_93 (75) = happyShift action_46
action_93 (9) = happyGoto action_71
action_93 (25) = happyGoto action_112
action_93 (26) = happyGoto action_29
action_93 (27) = happyGoto action_30
action_93 (28) = happyGoto action_31
action_93 (30) = happyGoto action_32
action_93 (32) = happyGoto action_33
action_93 (34) = happyGoto action_34
action_93 (36) = happyGoto action_35
action_93 (38) = happyGoto action_36
action_93 (39) = happyGoto action_37
action_93 (40) = happyGoto action_38
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (41) = happyShift action_39
action_94 (42) = happyShift action_15
action_94 (43) = happyShift action_40
action_94 (44) = happyShift action_41
action_94 (45) = happyShift action_42
action_94 (60) = happyShift action_43
action_94 (65) = happyShift action_44
action_94 (74) = happyShift action_45
action_94 (75) = happyShift action_46
action_94 (9) = happyGoto action_71
action_94 (24) = happyGoto action_111
action_94 (25) = happyGoto action_28
action_94 (26) = happyGoto action_29
action_94 (27) = happyGoto action_30
action_94 (28) = happyGoto action_31
action_94 (30) = happyGoto action_32
action_94 (32) = happyGoto action_33
action_94 (34) = happyGoto action_34
action_94 (36) = happyGoto action_35
action_94 (38) = happyGoto action_36
action_94 (39) = happyGoto action_37
action_94 (40) = happyGoto action_38
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (41) = happyShift action_39
action_95 (42) = happyShift action_15
action_95 (43) = happyShift action_40
action_95 (44) = happyShift action_41
action_95 (45) = happyShift action_42
action_95 (60) = happyShift action_43
action_95 (65) = happyShift action_44
action_95 (74) = happyShift action_45
action_95 (75) = happyShift action_46
action_95 (9) = happyGoto action_71
action_95 (23) = happyGoto action_110
action_95 (24) = happyGoto action_27
action_95 (25) = happyGoto action_28
action_95 (26) = happyGoto action_29
action_95 (27) = happyGoto action_30
action_95 (28) = happyGoto action_31
action_95 (30) = happyGoto action_32
action_95 (32) = happyGoto action_33
action_95 (34) = happyGoto action_34
action_95 (36) = happyGoto action_35
action_95 (38) = happyGoto action_36
action_95 (39) = happyGoto action_37
action_95 (40) = happyGoto action_38
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_9

action_97 (41) = happyShift action_39
action_97 (42) = happyShift action_15
action_97 (43) = happyShift action_40
action_97 (44) = happyShift action_41
action_97 (45) = happyShift action_42
action_97 (60) = happyShift action_43
action_97 (65) = happyShift action_44
action_97 (74) = happyShift action_45
action_97 (75) = happyShift action_46
action_97 (9) = happyGoto action_71
action_97 (23) = happyGoto action_109
action_97 (24) = happyGoto action_27
action_97 (25) = happyGoto action_28
action_97 (26) = happyGoto action_29
action_97 (27) = happyGoto action_30
action_97 (28) = happyGoto action_31
action_97 (30) = happyGoto action_32
action_97 (32) = happyGoto action_33
action_97 (34) = happyGoto action_34
action_97 (36) = happyGoto action_35
action_97 (38) = happyGoto action_36
action_97 (39) = happyGoto action_37
action_97 (40) = happyGoto action_38
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_43

action_99 _ = happyReduce_44

action_100 _ = happyReduce_45

action_101 _ = happyReduce_46

action_102 _ = happyReduce_47

action_103 _ = happyReduce_49

action_104 _ = happyReduce_48

action_105 _ = happyReduce_51

action_106 _ = happyReduce_50

action_107 _ = happyReduce_52

action_108 _ = happyReduce_53

action_109 _ = happyReduce_41

action_110 _ = happyReduce_54

action_111 _ = happyReduce_56

action_112 _ = happyReduce_58

action_113 _ = happyReduce_60

action_114 _ = happyReduce_62

action_115 _ = happyReduce_64

action_116 _ = happyReduce_68

action_117 _ = happyReduce_74

action_118 _ = happyReduce_78

action_119 _ = happyReduce_82

action_120 _ = happyReduce_97

action_121 _ = happyReduce_14

action_122 (42) = happyShift action_7
action_122 (8) = happyGoto action_136
action_122 (12) = happyGoto action_137
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_29

action_124 (41) = happyShift action_39
action_124 (42) = happyShift action_15
action_124 (43) = happyShift action_40
action_124 (44) = happyShift action_41
action_124 (45) = happyShift action_42
action_124 (60) = happyShift action_43
action_124 (65) = happyShift action_44
action_124 (74) = happyShift action_45
action_124 (75) = happyShift action_46
action_124 (9) = happyGoto action_24
action_124 (21) = happyGoto action_135
action_124 (23) = happyGoto action_26
action_124 (24) = happyGoto action_27
action_124 (25) = happyGoto action_28
action_124 (26) = happyGoto action_29
action_124 (27) = happyGoto action_30
action_124 (28) = happyGoto action_31
action_124 (30) = happyGoto action_32
action_124 (32) = happyGoto action_33
action_124 (34) = happyGoto action_34
action_124 (36) = happyGoto action_35
action_124 (38) = happyGoto action_36
action_124 (39) = happyGoto action_37
action_124 (40) = happyGoto action_38
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (41) = happyShift action_39
action_125 (42) = happyShift action_15
action_125 (43) = happyShift action_40
action_125 (44) = happyShift action_41
action_125 (45) = happyShift action_42
action_125 (60) = happyShift action_43
action_125 (65) = happyShift action_44
action_125 (74) = happyShift action_45
action_125 (75) = happyShift action_46
action_125 (9) = happyGoto action_24
action_125 (21) = happyGoto action_134
action_125 (23) = happyGoto action_26
action_125 (24) = happyGoto action_27
action_125 (25) = happyGoto action_28
action_125 (26) = happyGoto action_29
action_125 (27) = happyGoto action_30
action_125 (28) = happyGoto action_31
action_125 (30) = happyGoto action_32
action_125 (32) = happyGoto action_33
action_125 (34) = happyGoto action_34
action_125 (36) = happyGoto action_35
action_125 (38) = happyGoto action_36
action_125 (39) = happyGoto action_37
action_125 (40) = happyGoto action_38
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (41) = happyShift action_39
action_126 (42) = happyShift action_62
action_126 (43) = happyShift action_40
action_126 (44) = happyShift action_41
action_126 (45) = happyShift action_42
action_126 (60) = happyShift action_43
action_126 (65) = happyShift action_44
action_126 (74) = happyShift action_45
action_126 (75) = happyShift action_46
action_126 (81) = happyShift action_67
action_126 (8) = happyGoto action_131
action_126 (9) = happyGoto action_132
action_126 (20) = happyGoto action_133
action_126 (21) = happyGoto action_61
action_126 (23) = happyGoto action_26
action_126 (24) = happyGoto action_27
action_126 (25) = happyGoto action_28
action_126 (26) = happyGoto action_29
action_126 (27) = happyGoto action_30
action_126 (28) = happyGoto action_31
action_126 (30) = happyGoto action_32
action_126 (32) = happyGoto action_33
action_126 (34) = happyGoto action_34
action_126 (36) = happyGoto action_35
action_126 (38) = happyGoto action_36
action_126 (39) = happyGoto action_37
action_126 (40) = happyGoto action_38
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_40

action_128 _ = happyReduce_21

action_129 _ = happyReduce_18

action_130 (81) = happyShift action_18
action_130 (84) = happyShift action_19
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (41) = happyShift action_39
action_131 (42) = happyShift action_15
action_131 (43) = happyShift action_40
action_131 (44) = happyShift action_41
action_131 (45) = happyShift action_42
action_131 (60) = happyShift action_43
action_131 (65) = happyShift action_44
action_131 (74) = happyShift action_45
action_131 (75) = happyShift action_46
action_131 (81) = happyShift action_67
action_131 (9) = happyGoto action_144
action_131 (20) = happyGoto action_145
action_131 (21) = happyGoto action_61
action_131 (23) = happyGoto action_26
action_131 (24) = happyGoto action_27
action_131 (25) = happyGoto action_28
action_131 (26) = happyGoto action_29
action_131 (27) = happyGoto action_30
action_131 (28) = happyGoto action_31
action_131 (30) = happyGoto action_32
action_131 (32) = happyGoto action_33
action_131 (34) = happyGoto action_34
action_131 (36) = happyGoto action_35
action_131 (38) = happyGoto action_36
action_131 (39) = happyGoto action_37
action_131 (40) = happyGoto action_38
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (50) = happyShift action_98
action_132 (51) = happyShift action_99
action_132 (52) = happyShift action_100
action_132 (53) = happyShift action_101
action_132 (54) = happyShift action_102
action_132 (55) = happyShift action_103
action_132 (56) = happyShift action_104
action_132 (57) = happyShift action_105
action_132 (58) = happyShift action_106
action_132 (59) = happyShift action_107
action_132 (84) = happyShift action_108
action_132 (88) = happyShift action_143
action_132 (22) = happyGoto action_97
action_132 _ = happyReduce_93

action_133 (41) = happyShift action_39
action_133 (42) = happyShift action_15
action_133 (43) = happyShift action_40
action_133 (44) = happyShift action_41
action_133 (45) = happyShift action_42
action_133 (60) = happyShift action_43
action_133 (65) = happyShift action_44
action_133 (74) = happyShift action_45
action_133 (75) = happyShift action_46
action_133 (81) = happyShift action_67
action_133 (9) = happyGoto action_24
action_133 (20) = happyGoto action_142
action_133 (21) = happyGoto action_61
action_133 (23) = happyGoto action_26
action_133 (24) = happyGoto action_27
action_133 (25) = happyGoto action_28
action_133 (26) = happyGoto action_29
action_133 (27) = happyGoto action_30
action_133 (28) = happyGoto action_31
action_133 (30) = happyGoto action_32
action_133 (32) = happyGoto action_33
action_133 (34) = happyGoto action_34
action_133 (36) = happyGoto action_35
action_133 (38) = happyGoto action_36
action_133 (39) = happyGoto action_37
action_133 (40) = happyGoto action_38
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (47) = happyShift action_141
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (47) = happyShift action_140
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (42) = happyShift action_15
action_136 (9) = happyGoto action_139
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (47) = happyShift action_138
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_15

action_139 (82) = happyShift action_153
action_139 _ = happyReduce_16

action_140 (85) = happyShift action_50
action_140 (13) = happyGoto action_152
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (85) = happyShift action_50
action_141 (13) = happyGoto action_151
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (41) = happyShift action_39
action_142 (42) = happyShift action_15
action_142 (43) = happyShift action_40
action_142 (44) = happyShift action_41
action_142 (45) = happyShift action_42
action_142 (47) = happyShift action_150
action_142 (60) = happyShift action_43
action_142 (65) = happyShift action_44
action_142 (74) = happyShift action_45
action_142 (75) = happyShift action_46
action_142 (9) = happyGoto action_24
action_142 (21) = happyGoto action_149
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

action_143 (42) = happyShift action_15
action_143 (9) = happyGoto action_148
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (50) = happyShift action_98
action_144 (51) = happyShift action_99
action_144 (52) = happyShift action_100
action_144 (53) = happyShift action_101
action_144 (54) = happyShift action_102
action_144 (55) = happyShift action_103
action_144 (56) = happyShift action_104
action_144 (57) = happyShift action_105
action_144 (58) = happyShift action_106
action_144 (59) = happyShift action_107
action_144 (84) = happyShift action_108
action_144 (88) = happyShift action_147
action_144 (22) = happyGoto action_97
action_144 _ = happyReduce_93

action_145 (41) = happyShift action_39
action_145 (42) = happyShift action_15
action_145 (43) = happyShift action_40
action_145 (44) = happyShift action_41
action_145 (45) = happyShift action_42
action_145 (60) = happyShift action_43
action_145 (65) = happyShift action_44
action_145 (74) = happyShift action_45
action_145 (75) = happyShift action_46
action_145 (81) = happyShift action_67
action_145 (9) = happyGoto action_24
action_145 (20) = happyGoto action_146
action_145 (21) = happyGoto action_61
action_145 (23) = happyGoto action_26
action_145 (24) = happyGoto action_27
action_145 (25) = happyGoto action_28
action_145 (26) = happyGoto action_29
action_145 (27) = happyGoto action_30
action_145 (28) = happyGoto action_31
action_145 (30) = happyGoto action_32
action_145 (32) = happyGoto action_33
action_145 (34) = happyGoto action_34
action_145 (36) = happyGoto action_35
action_145 (38) = happyGoto action_36
action_145 (39) = happyGoto action_37
action_145 (40) = happyGoto action_38
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (41) = happyShift action_39
action_146 (42) = happyShift action_15
action_146 (43) = happyShift action_40
action_146 (44) = happyShift action_41
action_146 (45) = happyShift action_42
action_146 (47) = happyShift action_161
action_146 (60) = happyShift action_43
action_146 (65) = happyShift action_44
action_146 (74) = happyShift action_45
action_146 (75) = happyShift action_46
action_146 (9) = happyGoto action_24
action_146 (21) = happyGoto action_160
action_146 (23) = happyGoto action_26
action_146 (24) = happyGoto action_27
action_146 (25) = happyGoto action_28
action_146 (26) = happyGoto action_29
action_146 (27) = happyGoto action_30
action_146 (28) = happyGoto action_31
action_146 (30) = happyGoto action_32
action_146 (32) = happyGoto action_33
action_146 (34) = happyGoto action_34
action_146 (36) = happyGoto action_35
action_146 (38) = happyGoto action_36
action_146 (39) = happyGoto action_37
action_146 (40) = happyGoto action_38
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (42) = happyShift action_15
action_147 (9) = happyGoto action_159
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (47) = happyShift action_158
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (47) = happyShift action_157
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (85) = happyShift action_50
action_150 (13) = happyGoto action_156
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (79) = happyShift action_155
action_151 _ = happyReduce_30

action_152 _ = happyReduce_38

action_153 (42) = happyShift action_7
action_153 (8) = happyGoto action_136
action_153 (12) = happyGoto action_154
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_17

action_155 (85) = happyShift action_50
action_155 (13) = happyGoto action_167
action_155 _ = happyFail (happyExpListPerState 155)

action_156 _ = happyReduce_32

action_157 (85) = happyShift action_50
action_157 (13) = happyGoto action_166
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (85) = happyShift action_50
action_158 (13) = happyGoto action_165
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (47) = happyShift action_164
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (47) = happyShift action_163
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (85) = happyShift action_50
action_161 (13) = happyGoto action_162
action_161 _ = happyFail (happyExpListPerState 161)

action_162 _ = happyReduce_33

action_163 (85) = happyShift action_50
action_163 (13) = happyGoto action_169
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (85) = happyShift action_50
action_164 (13) = happyGoto action_168
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_36

action_166 _ = happyReduce_35

action_167 _ = happyReduce_31

action_168 _ = happyReduce_37

action_169 _ = happyReduce_34

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

happyReduce_32 = happyReduce 6 18 happyReduction_32
happyReduction_32 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Iter happy_var_3 happy_var_4 EmptyTerm happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 7 18 happyReduction_33
happyReduction_33 ((HappyAbsSyn13  happy_var_7) `HappyStk`
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

happyReduce_34 = happyReduce 8 18 happyReduction_34
happyReduction_34 ((HappyAbsSyn13  happy_var_8) `HappyStk`
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
happyReduction_41 (HappyAbsSyn23  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn21
		 (SimpleAssig happy_var_2 happy_var_1 (WithOutAssig happy_var_3)
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
happyReduction_87 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (UnaryExpr Pos happy_var_2
	)
happyReduction_87 _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_1  38 happyReduction_88
happyReduction_88 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn38
		 (SingleExpr happy_var_1
	)
happyReduction_88 _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  39 happyReduction_89
happyReduction_89 _
	 =  HappyAbsSyn39
		 (Pos
	)

happyReduce_90 = happySpecReduce_1  39 happyReduction_90
happyReduction_90 _
	 =  HappyAbsSyn39
		 (Neg
	)

happyReduce_91 = happySpecReduce_1  39 happyReduction_91
happyReduction_91 _
	 =  HappyAbsSyn39
		 (Not
	)

happyReduce_92 = happySpecReduce_1  39 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn39
		 (Inv
	)

happyReduce_93 = happySpecReduce_1  40 happyReduction_93
happyReduction_93 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn40
		 (VarAtom happy_var_1
	)
happyReduction_93 _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_1  40 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn40
		 (T
	)

happyReduce_95 = happySpecReduce_1  40 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn40
		 (F
	)

happyReduce_96 = happySpecReduce_1  40 happyReduction_96
happyReduction_96 (HappyTerminal (Number happy_var_1))
	 =  HappyAbsSyn40
		 (VarAtom (Name happy_var_1)
	)
happyReduction_96 _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  40 happyReduction_97
happyReduction_97 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (ExprPar happy_var_2
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 90 90 notHappyAtAll (HappyState action) sts stk []

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
	InvT -> cont 60;
	OrT -> cont 61;
	AndT -> cont 62;
	RShiftT -> cont 63;
	LShiftT -> cont 64;
	NotT -> cont 65;
	AndAndT -> cont 66;
	OrOrT -> cont 67;
	EqT -> cont 68;
	NotEqT -> cont 69;
	GTT -> cont 70;
	LTT -> cont 71;
	GTET -> cont 72;
	LTET -> cont 73;
	TrueT -> cont 74;
	FalseT -> cont 75;
	ForT -> cont 76;
	IfT -> cont 77;
	WhileT -> cont 78;
	ElseT -> cont 79;
	ReturnT -> cont 80;
	SemiT -> cont 81;
	CommaT -> cont 82;
	IncludeT -> cont 83;
	AsT -> cont 84;
	LParT -> cont 85;
	RParT -> cont 86;
	QuotesT -> cont 87;
	ColonT -> cont 88;
	XorT -> cont 89;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 90 tk tks = happyError' (tks, explist)
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
