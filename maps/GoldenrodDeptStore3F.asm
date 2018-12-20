	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE3F_CLERK
	const GOLDENRODDEPTSTORE3F_SUPER_NERD
	const GOLDENRODDEPTSTORE3F_ROCKER

GoldenrodDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_3F
	closetext
	end

GoldenrodDeptStore3FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore3FSuperNerdText

GoldenrodDeptStore3FRockerScript:
	jumptextfaceplayer GoldenrodDeptStore3FRockerText

GoldenrodDeptStore3FDirectory:
	jumptext GoldenrodDeptStore3FDirectoryText

GoldenrodDeptStore3FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore3FSuperNerdText:
	text "나 난 서 성급해서"
	line "포 포켓몬 배틀 때에도"
	cont "스피드 업을 사용해서"
	cont "포 포켓몬의 스피드를 높인다!"
	done

GoldenrodDeptStore3FRockerText:
	text "오오 시합할 때 포켓몬에게"
	line "스페셜 업은 쓰고 있는가?"

	para "특수 공격이 올라가서"
	line "확실히 좋은 기분이지!"
	done

GoldenrodDeptStore3FDirectoryText:
	text "승부에서 이기기 위해"
	line "3층……배틀 컬렉션"
	done

GoldenrodDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_2F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_4F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore3FElevatorButton

	db 3 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FClerkScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FSuperNerdScript, -1
	object_event  2,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FRockerScript, -1
