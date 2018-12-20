	const_def 2 ; object constants
	const CELADONGAMECORNERPRIZEROOM_GENTLEMAN
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST

CeladonGameCornerPrizeRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGameCornerPrizeRoomGentlemanScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomGentlemanText

CeladonGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPharmacistText

CeladonGameCornerPrizeRoomTMVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
	writetext CeladonPrizeRoom_AskWhichPrizeText
CeladonPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu CeladonPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .doubleteam
	ifequal 2, .psychic
	ifequal 3, .hyperbeam
	jump CeladonPrizeRoom_cancel

.doubleteam
	checkcoins 1500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_DOUBLE_TEAM, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_DOUBLE_TEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 1500
	jump CeladonPrizeRoom_purchased

.psychic
	checkcoins 3500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_PSYCHIC_M, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_PSYCHIC_M
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 3500
	jump CeladonPrizeRoom_purchased

.hyperbeam
	checkcoins 7500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_HYPER_BEAM, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_HYPER_BEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 7500
	jump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	jump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_cancel:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM32    1500@"
	db "TM29    3500@"
	db "TM15    7500@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomPokemonVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
.loop
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .pikachu
	ifequal 2, .porygon
	ifequal 3, .larvitar
	jump CeladonPrizeRoom_cancel

.pikachu
	checkcoins 2222
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem PIKACHU, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25
	takecoins 2222
	jump .loop

.porygon
	checkcoins 5555
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem PORYGON, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15
	takecoins 5555
	jump .loop

.larvitar
	checkcoins 8888
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem LARVITAR, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte LARVITAR
	special GameCornerPrizeMonCheckDex
	givepoke LARVITAR, 40
	takecoins 8888
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "PORYGON    5555@"
	db "LARVITAR   8888@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomGentlemanText:
	text "폴리곤을 가지고 싶었는데……"
	line "동전이 앞으로 100개 남았는데"
	cont "모이지 않았다……!"
	done

CeladonGameCornerPrizeRoomPharmacistText:
	text "후우우우우……"

	para "그렇게 중독이 되지 않도록"
	line "주의를 하지 않으면……"

	para "돈을 전부 써버린다면"
	line "어쩔 수 없을테니까……"
	done

CeladonPrizeRoom_PrizeVendorIntroText:
	text "어서오세요!"

	para "게임을 해서 모은 동전은"
	line "여기서 좋아하는"
	cont "경품으로 교환할 수 있습니다!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "어느 것이 좋습니까?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text  "@"
	text_ram wStringBuffer3
	text "(으)로"
	line "하겠습니까?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "자 받으세요!"
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "동전이 부족합니다"
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "그 이상은 지닐 수 없습니다"
	done

CeladonPrizeRoom_ComeAgainText:
	text "그렇습니까"
	line "동전을 모아서 와주세요!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "응?"
	line "동전 케이스가 없군요"
	done

CeladonGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  5, CELADON_CITY, 7
	warp_event  3,  5, CELADON_CITY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomTMVendor
	bg_event  4,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomPokemonVendor

	db 2 ; object events
	object_event  0,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomGentlemanScript, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPharmacistScript, -1
