	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE4F_CLERK
	const GOLDENRODDEPTSTORE4F_COOLTRAINER_M
	const GOLDENRODDEPTSTORE4F_BUG_CATCHER
	const GOLDENRODDEPTSTORE4F_GAMEBOY_KID

GoldenrodDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

GoldenrodDeptStore4FCooltrainerMScript:
	jumptextfaceplayer GoldenrodDeptStore4FCooltrainerMText

GoldenrodDeptStore4FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore4FBugCatcherText

GoldenrodDeptStore4FGameboyKidScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStore4FGameboyKidText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

GoldenrodDeptStore4FDirectory:
	jumptext GoldenrodDeptStore4FDirectoryText

GoldenrodDeptStore4FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore4FCooltrainerMText:
	text "강한 포켓몬을 좋아해서"
	line "타우린을 줘서"
	cont "공격력을 높여놓았지!"
	done

GoldenrodDeptStore4FBugCatcherText:
	text "사포닌으로 포켓몬의"
	line "방어력을 업하고 있어!"
	done

GoldenrodDeptStore4FGameboyKidText:
	text "통신 케이블을 통하게 하는 것으로"
	line "진화하는 포켓몬도 있단다"

	para "근육몬 윤겔라 고우스트"
	line "데구리 4종류이지만"
	cont "그밖에도 있다고들 말한단다"
	done

GoldenrodDeptStore4FDirectoryText:
	text "포켓몬의 능력 업하자!"
	line "4층..메디신 박스"
	done

GoldenrodDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_5F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_3F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FClerkScript, -1
	object_event 11,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FBugCatcherScript, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore4FGameboyKidScript, -1
