	const_def 2 ; object constants
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_LASS
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_YOUNGSTER

CherrygroveEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveEvolutionSpeechHouseYoungsterScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseYoungsterText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseLassScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseLassText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseBookshelf:
	jumpstd magazinebookshelf

CherrygroveEvolutionSpeechHouseYoungsterText:
	text "포켓몬이라고 하는 것은"
	line "싸움을 거치면 경험을 쌓아"
	cont "모습이 변한단다"
	done

CherrygroveEvolutionSpeechHouseLassText:
	text "포켓몬의 모습이 변해버려?"

	para "갑자기 바뀌면"
	line "깜짝 놀라버릴꺼야!"
	done

CherrygroveEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 5
	warp_event  3,  7, CHERRYGROVE_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf

	db 2 ; object events
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseLassScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseYoungsterScript, -1
