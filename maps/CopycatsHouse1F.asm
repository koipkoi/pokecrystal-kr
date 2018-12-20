	const_def 2 ; object constants
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText_ReturnedMachinePart
	waitbutton
	closetext
	end

CopycatsHouse1FBlisseyScript:
	opentext
	writetext CopycatsHouse1FBlisseyText
	cry BLISSEY
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "…… 곤란한 것은 딸애가"
	line "사람들의 흉내를 내는 것이지!"

	para "하루종일 사람들을 놀려서"
	line "근처에서는"
	cont "흉내내기 아가씨라고 불려진다!"
	done

CopycatsHouse1FPokefanFText:
	text "댁의 따님은"
	line "정말 제멋대로 키워서……"
	cont "친구들도 그다지 많지 않아요"
	done

CopycatsHouse1FPokefanFText_ReturnedMachinePart:
	text "3년전 남자아이에게 얻은"
	line "삐삐인형을 잃어버리고부터"

	para "점점 흉내내기에"
	line "자신이 없어져서……"
	done

CopycatsHouse1FBlisseyText:
	text "해피너스『해피!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FBlisseyScript, -1
