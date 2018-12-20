	const_def 2 ; object constants
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUY

FuchsiaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuchsiaGymJanineScript:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	faceplayer
	opentext
	writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	jump .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext JanineText_ToxicSpeech
	buttonsound
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext JanineText_ApplyMyself
	waitbutton
	closetext
	end

LassAliceScript:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special LoadUsedSpritesGFX
.AliceUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceAfterScript
	writetext LassAliceBeforeText
	waitbutton
	closetext
	winlosstext LassAliceBeatenText, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue .AliceBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

.AliceBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

.AliceAfterScript:
	writetext LassAliceAfterText
	waitbutton
	closetext
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special LoadUsedSpritesGFX
.LindaUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaAfterScript
	writetext LassLindaBeforeText
	waitbutton
	closetext
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

.LindaAfterScript:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	special LoadUsedSpritesGFX
.CindyUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyAfterScript
	writetext PicnickerCindyBeforeText
	waitbutton
	closetext
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

.CindyAfterScript:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
.BarryUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryAfterScript
	writetext CamperBarryBeforeText
	waitbutton
	closetext
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

.BarryAfterScript:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

FuchsiaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuyWinScript
	writetext FuchsiaGymGuyText
	waitbutton
	closetext
	end

.FuchsiaGymGuyWinScript:
	writetext FuchsiaGymGuyWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JANINE, JANINE1, MEM_BUFFER_1
	jumpstd gymstatue2

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

JanineText_DisappointYou:
	text "후후후……"
	line "유감이네……"

	para "라고 말한 것은 거짓말!"

	para "내가 진짜!"
	line "연분홍시티 체육관의 도희란다!"
	done

JanineText_ToughOne:
	text "도희『강하구나 너!"
	line "졌다 그것도 완전히……"

	para "자 이것을 가져가!"
	line "핑크배지야!"
	done

Text_ReceivedSoulBadge:
	text "<PLAYER>는(은) 도희로부터"
	line "핑크배지를 받았다!"
	done

JanineText_ToxicSpeech:
	text "도희『너 강하구나!"
	line "특별히 이걸줄께!"

	para "강한 독이라서"
	line "상대방의 체력을 빼앗는"
	cont "맹독이라는 기술이야!"
	done

JanineText_ApplyMyself:
	text "도희『더욱 수행을 해서"
	line "더욱 더 강해질꺼야!"

	para "내 아버지께도"
	line "너에게도 지지 않도록말야!"
	done

LassAliceBeforeText:
	text "후훗!"
	line "내가 관장 도희……"
	cont "이라니!"
	cont "걸려들었구나!"
	done

LassAliceBeatenText:
	text "멋지게 속였는데……!"
	done

LassAliceAfterText:
	text "누가 진짜 관장인가"
	line "보고 알 수 있을까?"
	done

LassLindaBeforeText:
	text "속았지!"
	line "아하하하!"
	done

LassLindaBeatenText:
	text "졌다……!"
	line "강하구나 이사람은!"
	done

LassLindaAfterText:
	text "어떠니?"
	line "내 변장술"
	cont "꼭 닮았지!"
	done

PicnickerCindyBeforeText:
	text "내가 도희!"
	line "잘도 알아챘구나!"
	cont "승부닷!"
	done

PicnickerCindyBeatenText:
	text "……분하다!"
	line "이기고싶었는데!"
	done

PicnickerCindyAfterText:
	text "이제 슬슬"
	line "지치기 시작한 것 같군!"
	done

CamperBarryBeforeText:
	text "왓 하핫!"

	para "그래!"
	line "내가 도희란다!"
	done

CamperBarryBeatenText:
	text "완벽한 변장이었는데"
	line "분해랏!"
	done

CamperBarryAfterText:
	text "꽤 귀여운"
	line "변장을 했었지!"
	done

FuchsiaGymGuyText:
	text "여어!"
	line "미래의 챔피언!"

	para "……오호!"
	line "잘 둘러 보아라!"
	cont "관장 도희가"
	cont "많이 있단다!"

	para "진짜는 누구일까!?"
	done

FuchsiaGymGuyWinText:
	text "멋있는 싸움이었다"
	line "성도의 트레이너!"
	done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	db 6 ; object events
	object_event  1, 10, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  5,  7, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassAliceScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuyScript, -1
