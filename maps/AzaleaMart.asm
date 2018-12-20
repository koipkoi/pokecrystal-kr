	const_def 2 ; object constants
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER

AzaleaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzaleaMartCooltrainerMScript:
	jumptextfaceplayer AzaleaMartCooltrainerMText

AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "움 수퍼볼이 없나"
	line "몬스터볼로 참을 수 밖에"
	
	para "사실은 강집 할아버지가"
	line "볼을 만들어 주셨으면 좋겠는데"
	done

AzaleaMartBugCatcherText:
	text "수퍼볼을 사용하면"
	line "몬스터볼 보다도"
	cont "포켓몬을 잡기 쉬워진단다"
	
	para "하지만 때에 따라서는"
	line "강집 할아버지의 볼이 최고지"
	done

AzaleaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
