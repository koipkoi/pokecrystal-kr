	const_def 2 ; object constants
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "나의 이브이"
	line "에브이로 진화 했단다"

	para "하지만 친구의 이브이는"
	line "블래키로 진화했어"

	para "뭔가 틀렸었나"
	line "둘다 계속 이브이인 채로"
	cont "키우고 있었는데……"
	done

EcruteakMartGrannyText:
	text "기력의 조각을 사용해주면"
	line "기절한 포켓몬도 깨울 수 있어요"
	done

EcruteakMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
