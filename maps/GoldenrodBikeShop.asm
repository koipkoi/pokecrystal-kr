	const_def 2 ; object constants
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike:
; unused
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "하아……"
	line "일부러 멀리서 금빛시티까지 왔는데"
	cont "자전거가 전혀 팔리지 않아"

	para "어째서일까?"
	line "너 자전거를 타고 돌아다니며"
	cont "선전을 해주지 않겠니?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "저 정말?"

	para "그럼 이름이랑 전화번호"
	line "가르쳐줘"
	cont "자전거를 빌려줄테니까"
	done

BorrowedABicycleText:
	text "<PLAYER>는(은)"
	line "자전거를 빌렸다!"
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "미라클 사이클의 자전거는"
	line "성능 최고니까!"
	cont "어떤 길이라도 씽씽 달린단다!"
	done

GoldenrodBikeShopClerkRefusedText:
	text "하아……"
	line "사람들의 친절함에 젖어들고싶어"
	done

; possibly unused
GoldenrodBikeShopJustReleasedCompactBikeText:
	text "드디어 발매!"
	line "최고급 컴팩트 사이클"
	done

GoldenrodBikeShopBicycleText:
	text "번쩍번쩍거리는 자전거다!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
