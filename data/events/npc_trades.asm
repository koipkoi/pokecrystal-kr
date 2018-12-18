npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	shift
	dw \7
	db \8, \9, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_COLLECTOR, ABRA,       MACHOP,     "근육@@@@@@@", $37, $66, GOLD_BERRY,   37460, "청수@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BELLSPROUT, ONIX,       "덜덜이@@@@@", $96, $66, BITTER_BERRY, 48926, "수빈@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     VOLTORB,    "찌릭@@@@@@@", $98, $88, PRZCUREBERRY, 29189, "중수@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRAGONAIR,  DODRIO,     "동동이@@@@@", $77, $66, SMOKE_BALL,   00283, "미사@@@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "장달이@@@@@", $96, $86, MYSTERYBERRY, 15616, "정진@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "파치@@@@@@@", $96, $66, GOLD_BERRY,   26491, "정숙@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "사철이@@@@@", $96, $66, METAL_COAT,   50082, "임남@@@@@@@", TRADE_GENDER_EITHER
