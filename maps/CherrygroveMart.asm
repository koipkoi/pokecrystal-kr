	const_def 2 ; object constants
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "몬스터볼 품절이래!"
	line "다음에 살 수 있을 때는 언제일까"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "몬스터 볼을 살 수 있다!"
	line "이것으로 포켓몬을 잡을 수 있겠군"
	done

CherrygroveMartYoungsterText:
	text "풀숲을 지나가다가"
	line "벌레포켓몬에게 독을 쏘였었다!"

	para "그런데 그대로 걸어가다가"
	line "포켓몬이 쓰러졌었다!"

	para "해독제는 가지고 가는편이 좋아"
	done

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
