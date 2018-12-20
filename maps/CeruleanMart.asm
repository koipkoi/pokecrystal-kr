	const_def 2 ; object constants
	const CERULEANMART_CLERK
	const CERULEANMART_COOLTRAINER_M
	const CERULEANMART_COOLTRAINER_F

CeruleanMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CERULEAN
	closetext
	end

CeruleanMart_CooltrainerM:
	jumptextfaceplayer CeruleanMart_CooltrainerMText

CeruleanMart_CooltrainerF:
	jumptextfaceplayer CeruleanMart_CooltrainerFText

CeruleanMart_CooltrainerMText:
	text "블루시티의 호수공원으로 가는 도중"
	line "많은 트레이너가 있단다"

	para "걸려들면 트레이너의"
	line "실력을 확인하고 있으니까"
	done

CeruleanMart_CooltrainerFText:
	text "블루시티의 호수공원에 있는"
	line "트레이너들을 이긴 사람은"
	cont "이 마을에서 체육관 관장인"
	cont "이슬이 정도야!"
	done

CeruleanMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 6
	warp_event  3,  7, CERULEAN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanMart_Clerk, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanMart_CooltrainerM, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanMart_CooltrainerF, -1
