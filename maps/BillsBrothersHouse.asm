	const_def 2 ; object constants
	const BILLSBROTHERSHOUSE_POKEFAN_F
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsBrotherScript:
	jumptextfaceplayer BillsBrotherText

BillsBrothersHouseYoungsterScript:
	jumptextfaceplayer BillsBrothersHouseYoungsterText

BillsBrotherText:
	text "우리 할아버지"
	line "블루시티의 호수공원에 있는"
	cont "이수재의 집에"
	cont "놀러갔어"
	done

BillsBrothersHouseYoungsterText:
	text "자전거 길에서"
	line "느릿느릿 어슬렁거리는"
	cont "이상한 포켓몬을 봤어!"
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 4
	warp_event  3,  7, FUCHSIA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsBrotherScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseYoungsterScript, -1
