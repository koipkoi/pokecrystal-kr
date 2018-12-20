	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore1FReceptionistText:
	text "어서오세요!"
	line "금빛시티 백화점입니다"
	done

GoldenrodDeptStore1FGentlemanText:
	text "금빛시티 백화점에는"
	line "여러가지 물건이 진열되어 있다"

	para "하지만 이 마을의"
	line "게임코너 경품이 아니면"
	cont "손에 넣을 수 없는 것도 있단다"
	done

GoldenrodDeptStore1FPokefanFText:
	text "자 오늘도"
	line "많이 쇼핑을 해야지!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "엄마는 쇼핑을 아주 잘하셔"

	para "약간 싼 가격에"
	line "도구를 사오신다"
	done

GoldenrodDeptStore1FDirectoryText:
	text "1층……서비스 카운터"
	line "2층……트레이너즈 마켓"
	cont "3층……배틀 컬렉션"
	cont "4층……메디신 박스"
	cont "5층……기술머신 코너"
	cont "6층……휴식의 광장"
	cont "    옥상관람대"
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	db 4 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
