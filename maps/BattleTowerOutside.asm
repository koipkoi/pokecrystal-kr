	const_def 2 ; object constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen:	
; unreferenced	
	text "배틀타워는 정말 크구나-!"
	line "올려다보고 있자니 목이 뻐근해졌어!"
	done

BattleTowerOutsideYoungsterText_Mobile:	
; unreferenced	
	text "배틀타워는 정말 크구나-!"

	para "이 안에 많은 트레이너가"
	line "승부를 하고 있다는 것은"
	cont "수많은 종류의 포켓몬이"
	cont "여기에 모여있다는 거겠네!"
	done

BattleTowerOutsideYoungsterText:
	text "배틀타워는 정말 크구나-!"

	cont "수많은 종류의 포켓몬이"
	cont "여기에 모여있을거야!"
	done

BattleTowerOutsideBuenaText_NotYetOpen:	
; unreferenced	
	text "무엇을 하는 곳일까?"
	
	para "이름에 배틀이 들어갈 정도면"
	line "분명 포켓몬 배틀을"
	cont "많이 하는 곳이겠지!"
	done

BattleTowerOutsideBuenaText:	
	text "사용할 수 있는 포켓몬은 3마리"
	line "까지만이지?"
	cont "어느 아이로 승부하느냐가"
	cont "포인트란 말이야-"
	cont "하아- 고민된다-"
	done

BattleTowerOutsideSailorText_Mobile:	
; unreferenced	
	text "에헤헤…"
	line "일도 땡땡이치고"
	cont "와버렸다"

	para "리더가 될 때까지는"
	line "절대로! 포기할 수 없어서"
	done

BattleTowerOutsideSailorText:
	text "헤헤헤 일하다"
	line "몰래 나왔어"

	para "이기기 전까지는"
	line "빠져나갈 수 없지!"

	para "전부 이겨야만 해!"
	done

BattleTowerOutsideSignText_NotYetOpen:	
; unused; originally shown when the Battle Tower was closed	
	text "이곳은 배틀타워"
	done

BattleTowerOutsideSignText:	
	text "이곳은 배틀타워"
	line "노려라! 최강의 트레이너"
	done

BattleTowerOutsideText_DoorsClosed:	
; unused; originally shown when the Battle Tower was closed	
	text "배틀타워의 입구가"
	line "닫혀있다…"
	done

BattleTowerOutsideText_DoorsOpen:	
; unused; originally shown after the Battle Tower opened	
	text "열려있다!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	db 4 ; object events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
