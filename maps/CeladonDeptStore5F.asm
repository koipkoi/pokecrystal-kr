	const_def 2 ; object constants
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER

CeladonDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

CeladonDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

CeladonDeptStore5FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore5FGentlemanText

CeladonDeptStore5FSailorScript:
	jumptextfaceplayer CeladonDeptStore5FSailorText

CeladonDeptStore5FTeacherScript:
	jumptextfaceplayer CeladonDeptStore5FTeacherText

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore5FGentlemanText:
	text "포켓몬의 능력을 올리는"
	line "도구를 사고싶지만……"
	cont "우웅…… 돈이 모자라!"
	done

CeladonDeptStore5FSailorText:
	text "기술 포인트의 최대치를 높이는"
	line "포인트 업을 가지고싶은데"
	cont "가게에서는 팔지않아"
	cont "도구 어쩌구 하면서!"
	done

CeladonDeptStore5FTeacherText:
	text "도구를 사용해주면"
	line "포켓몬이 기뻐할꺼야!"
	cont "싫어하는 도구도 있지만……"
	done

CeladonDeptStore5FDirectoryText:
	text "5층……약품·스토어"
	done

CeladonDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_4F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_6F, 1
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore5FElevatorButton

	db 5 ; object events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk2Script, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FGentlemanScript, -1
	object_event  3,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FSailorScript, -1
	object_event  1,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FTeacherScript, -1
