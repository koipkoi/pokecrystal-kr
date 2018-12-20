	const_def 2 ; object constants
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	buttonsound
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnRadio:
	jumpstd radio2

CharcoalKilnBossText1:
	text "마을에서 야돈이 사라졌다"

	para "움 숲의 신이"
	line "분노하셨나……?"

	para "무엇이건 좋지 않은 징조일지도"
	line "이럴 때에는 가만히 있는게 좋아"
	done

CharcoalKilnBossText2:
	text "야돈은 돌아왔는가……"

	para "이번에는 견습하는 녀석이"
	line "너도밤나무 숲에서 돌아오질 않아"
	cont "언제까지 놀고 있는 것인가……"

	para "나 참!"
	line "할 수 없는 녀석이로군!"
	done

CharcoalKilnBossText3:
	text "로켓단을 쫓아낸"
	line "너도밤나무 숲도 겁없이 들어가다니"

	para "너의 배짱 마음에 들었다"
	line "어떤가! 나랑 함께"
	cont "수행하지 않겠는가?"
	done

CharcoalKilnApprenticeText1:
	text "어째서 야돈이 사라졌을까"
	line "어딘가에 놀러간 것일까?"
	done

CharcoalKilnApprenticeText2:
	text "그러고보니"
	line "너에게 답례를 하지 않았나?"

	para "이것 내가 만든 숯이란다"
	line "화염타입의 포켓몬에게"
	cont "지니게 하면 기뻐할지도 몰라!"
	done

CharcoalKilnApprenticeText3:
	text "야돈도 돌아왔고"
	line "파오리도 찾았다"
	cont "너 꽤나 멋있구나!"
	done

FarfetchdText:
	text "파오리『파오-리"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
