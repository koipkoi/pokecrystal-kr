	const_def 2 ; object constants
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "내가 들어놓은"
	line "무서운 이야기를 들려주겠다……"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "…… 으하!"
	line "밝을 때에 이야기를 하면"
	cont "전혀 재미가 없잖아!"

	para "해가 지면 오너라!"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "어떤 남자가 신비의"
	line "자전거를 선물 받았다……"

	para "남자아이는 기뻐서 바로"
	line "자전거를 타고 놀러를 갔다……"

	para "정신을 차리고 보니까 해가 져있다"
	line "주변은 캄캄한 암흑의 천지……"
	cont "너무 기뻐서 느끼지 못했던듯 하다"

	para "돌연 자전거의 스피드가"
	line "느려졌다"
	cont "페달이 무거워졌다!"
	cont "페달을 멈추자 자전거는"
	cont "저절로 뒤로 가고 있었다!"

	para "저주의 자전거가 남자아이를"
	line "지옥으로 끌고 가는 듯이……"

	para "…… …… ……"

	para "…… …… ……"

	para "꺄아아아악!"

	para "그곳은 자전거 길의"
	line "오르막길이었다"

	para "…… …… ……"
	line "후편을 기다리는 것 같아서……"

	para "이야기를 들어준 너에게"
	line "기술머신03을 주겠다!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "기술머신03은 저주!"
	line "상대방의 체력을"
	cont "점점 깎아먹는"
	cont "무서운 기술이란다!"
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
