	const_def 2 ; object constants
	const DARKCAVEBLACKTHORNENTRANCE_PHARMACIST
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2

DarkCaveBlackthornEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveBlackthornEntrancePharmacistText1
	buttonsound
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveBlackthornEntrancePharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_SNORE

DarkCaveBlackthornEntrancePharmacistText1:
	text "우와! 놀랬다!"

	para "검은 안경을 쓰고 있으니까"
	line "전혀 느끼지 못했다"

	para "여기서 뭘 하고 있었느냐구?"

	para "뭐 괜찮잖아!"
	line "너에게도 검은 안경을 줄테니까"
	cont "신경 쓰지마"
	done

DarkCaveBlackthornEntrancePharmacistText2:
	text "검은 안경……"
	line "포켓몬에게 지니게 하면 악타입의"
	cont "기술의 공격력이 올라간다"
	done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
