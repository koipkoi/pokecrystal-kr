	const_def 2 ; object constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

CianwoodLugiaSpeechHouseTeacherText:
	text "담청시티에서 왔니?"
	line "도중에 4개의 섬이 있었지"
	cont "섬 안에는 바다의 신이 살고 있대"
	done

CianwoodLugiaSpeechHouseLassText:
	text "은빛 날개를 가지고 있으면"
	line "만날 수 있다고 전해들었어"

	para "아마도 자신이랑"
	line "같은 향기가 나기 때문일지도"
	done

CianwoodLugiaSpeechHouseTwinText:
	text "섬 주변의 소용돌이는"
	line "바다의 신이 만들냈다고"
	cont "전해지는 이야기가 있어"

	para "그 소용돌이를 지나기 위해선"
	line "특별한 기술이 필요할거야"
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
