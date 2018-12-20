	const_def 2 ; object constants
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd radio2

EcruteakLugiaSpeechHouseGrampsText:
	text "내가 어렸을 적의 이야기"

	para "하늘이 갑자기"
	line "깜깜해졌다고 생각하는중에"
	cont "커다란 포켓몬이 날아왔다"

	para "용 같기도 하고"
	line "새 같기도 한 포켓몬은"
	cont "무엇이었을까?"
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "그런 커다란 포켓몬"
	line "정말 있을까?"
	cont "있다면 엄청 강할 것 같은데"
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
