	const_def 2 ; object constants
	const CIANWOODPHARMACY_PHARMACIST

CianwoodPharmacy_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	buttonsound
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd difficultbookshelf

PharmacistGiveSecretpotionText:
	text "너의 포켓몬"
	line "어딘가 중병이라도 있는건가"
	cont "뭔가 심각한 일이라도?"

	para "…… …… ……"

	para "흐-음"
	line "등대의 포켓몬인가"

	para "알았다!"
	line "그것이라면 이 약이지"
	cont "가지고 가거라"
	done

ReceivedSecretpotionText:
	text "<PLAYER>는(은)"
	line "비전 신약을 맡았다!"
	done

PharmacistDescribeSecretpotionText:
	text "나의 비전 신약은"
	line "효능이 너무 뛰어나기에"
	cont "아주 중증이 아니라면 주지 않는다"
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 4
	warp_event  3,  7, CIANWOOD_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
