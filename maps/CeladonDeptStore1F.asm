	const_def 2 ; object constants
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore1FReceptionistScript:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore1FReceptionistText:
	text "어서오세요!"
	line "무지개 백화점에 잘오셨습니다!"

	para "각 플로어의 안내는"
	line "오른쪽의 게시판을 봐 주세요"
	done

CeladonDeptStore1FGentlemanText:
	text "자매점인"
	line "금빛시티의 백화점에 맞춰서"
	cont "이 백화점도"
	cont "개장한 것 같아!"
	done

CeladonDeptStore1FTeacherText:
	text "처음으로 왔지만……"
	line "엄청나게 커서"
	cont "길을 잃어버릴 것 같아!"
	done

CeladonDeptStore1FDirectoryText:
	text "1층 …… 서비스·카운터"
	line "2층 …… 트레이너즈·숍"
	cont "3층 …… 기술머신·숍"
	cont "4층 …… 와이즈맨·기프트"
	cont "5층 …… 약품·스토어"
	cont "6층 …… 자동판매기"
	done

CeladonDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	db 3 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, -1
