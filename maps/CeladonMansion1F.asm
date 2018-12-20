	const_def 2 ; object constants
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionManager:
	jumptextfaceplayer CeladonMansionManagerText

CeladonMansion1FMeowth:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FClefairy:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CeladonMansion1FNidoranF:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1FBookshelf:
	jumpstd picturebookshelf

CeladonMansionManagerText:
	text "포켓몬에 둘러싸여 있으면"
	line "혼자 살아도……"
	cont "쓸쓸하지 않아……"

	para "우리집 나옹이는……"
	line "가끔씩 돈을 주워온단다!"
	done

CeladonMansion1FMeowthText:
	text "나옹『나-옹!"
	done

CeladonMansion1FClefairyText:
	text "삐삐『삐 삐삐!"
	done

CeladonMansion1FNidoranFText:
	text "니드런『니드 니드런!"
	done

CeladonMansionManagersSuiteSignText:
	text "무지개 맨션"
	line "…… 관리인실"
	done

CeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_READ, CeladonMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, CeladonMansion1FBookshelf

	db 4 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManager, -1
	object_event  2,  6, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	object_event  3,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	object_event  4,  4, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
