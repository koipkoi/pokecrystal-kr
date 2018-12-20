	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE5F_CLERK
	const GOLDENRODDEPTSTORE5F_LASS
	const GOLDENRODDEPTSTORE5F_MIKE
	const GOLDENRODDEPTSTORE5F_POKEFAN_M
	const GOLDENRODDEPTSTORE5F_CARRIE
	const GOLDENRODDEPTSTORE5F_RECEPTIONIST

GoldenrodDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckIfSunday

.CheckIfSunday:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .yes
	disappear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

.yes
	appear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

GoldenrodDeptStore5FClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .headbutt
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .onlyrocksmash
	jump .neither

.headbutt
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .both
	jump .onlyheadbutt

.neither
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_1
	closetext
	end

.onlyheadbutt
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_2
	closetext
	end

.onlyrocksmash
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_3
	closetext
	end

.both
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_4
	closetext
	end

GoldenrodDeptStore5FReceptionistScript:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .EventIsOver
	checkflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	iftrue .EventIsOver
	special GetFirstPokemonHappiness
	writetext UnknownText_0x56143
	buttonsound
	ifgreater 150 - 1, .VeryHappy
	ifgreater 50 - 1, .SomewhatHappy
	jump .NotVeryHappy

.VeryHappy:
	writetext UnknownText_0x5615a
	buttonsound
	verbosegiveitem TM_RETURN
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.SomewhatHappy:
	writetext UnknownText_0x561a6
	waitbutton
	closetext
	end

.NotVeryHappy:
	writetext UnknownText_0x561d8
	buttonsound
	verbosegiveitem TM_FRUSTRATION
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.EventIsOver:
	writetext UnknownText_0x56202
	waitbutton
.Done:
	closetext
	end

Carrie:
	faceplayer
	opentext
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBC ; This is a dummy check from Gold/Silver
	writetext UnknownText_0x56241
	waitbutton
	closetext
	special UnlockMysteryGift
	end

.NotGBC:
	writetext UnknownText_0x56279
	waitbutton
	closetext
	end

GoldenrodDeptStore5FLassScript:
	jumptextfaceplayer GoldenrodDeptStore5FLassText

Mike:
	faceplayer
	opentext
	trade NPC_TRADE_MIKE
	waitbutton
	closetext
	end

GoldenrodDeptStore5FPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStore5FPokefanMText

GoldenrodDeptStore5FDirectory:
	jumptext GoldenrodDeptStore5FDirectoryText

GoldenrodDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x56143:
	text "어서오세요!"

	para "엇 너의 포켓몬……"
	done

UnknownText_0x5615a:
	text "매우 잘 따르고 있는 것 같군"
	line "너희들의 콤비네이션이라면"
	cont "이 기술을 쓸 수 있을 것 같네"
	done

UnknownText_0x561a6:
	text "귀엽구나!"

	para "기술머신을 사용해서"
	line "좋은 기술을 가르쳐 주거라!"
	done

UnknownText_0x561d8:
	text "어쩐지 눈빛이 나쁘구나"
	line "그런 포켓몬에게는"
	cont "이 기술머신이 어떨까?"
	done

UnknownText_0x56202:
	text "틀림없이 너의 포켓몬에게"
	line "딱 맞는 기술머신이 있을꺼야"
	done

UnknownText_0x56241:
	text "이상한 소포"

	para "삐익!"

	para "하고 선물이 도달합니다"
	done

UnknownText_0x56279:
	text "이상한 소포"

	para "내 게임보이에서는"
	line "되지 않아요……"
	done

GoldenrodDeptStore5FLassText:
	text "일요일에 오는 언니"
	line "포켓몬의 상태를 보고"
	cont "기술머신을 주거나 한단다"
	done

GoldenrodDeptStore5FPokefanMText:
	text "다른 사람에게 얻은 포켓몬은"
	line "이름을 바꿀 수 없단다"

	para "이름을 붙인 사람의"
	line "마음이 담겨져 있으니까"
	done

GoldenrodDeptStore5FDirectoryText:
	text "당신의 희망을 포켓몬에게"
	line "5층……기술머신 코너"
	done

GoldenrodDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_4F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_6F, 1
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore5FElevatorButton

	db 6 ; object events
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FClerkScript, -1
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FLassScript, -1
	object_event  6,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Mike, -1
	object_event 13,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FPokefanMScript, -1
	object_event  9,  1, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Carrie, -1
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FReceptionistScript, EVENT_GOLDENROD_DEPT_STORE_5F_HAPPINESS_EVENT_LADY
