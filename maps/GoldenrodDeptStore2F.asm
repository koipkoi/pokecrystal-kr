	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

GoldenrodDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore2FUnusedText1:
; unused
	text "이곳에서는 포켓몬이 지닐 수 있는"
	line "물건을 여러가지 팔 작정이란다"

	para "이것은 서비스"
	line "포켓몬에게 지니게 하거라"
	done

GoldenrodDeptStore2FUnusedText2:
; unused
	text "포켓몬에게 도구를 지니게 하면"
	line "승부를 할 때"
	cont "여러가지 책략이 나온다고 한다"
	done

GoldenrodDeptStore2FYoungsterText:
	text "포켓기어로 등록할 수 있는"
	line "전화번호는 10명뿐이란다"

	para "누구의 전화번호를"
	line "등록 해둘까 망설여진다"
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "나의 캐이시"
	line "게임코너에서 손에 넣었어"
	cont "지금은 소중한 파트너가 되었다"
	done

GoldenrodDeptStore2FGentlemanText:
	text "백화점에 오면"
	line "금빛시티는 도회지구나 라고 생각되"

	para "이 상품 진열의 훌륭함"
	line "다른 곳이랑은 틀려 "
	done

GoldenrodDeptStore2FDirectoryText:
	text "여행의 친구에게"
	line "2층……트레이너즈 마켓"
	done

GoldenrodDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
