	const_def 2 ; object constants
	const BLACKTHORNMART_CLERK
	const BLACKTHORNMART_COOLTRAINER_M
	const BLACKTHORNMART_BLACK_BELT

BlackthornMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

BlackthornMartCooltrainerMScript:
	jumptextfaceplayer BlackthornMartCooltrainerMText

BlackthornMartBlackBeltScript:
	jumptextfaceplayer BlackthornMartBlackBeltText

BlackthornMartCooltrainerMText:
	text "프렌들리숍에서 살 수는 없지만"
	line "기력의 덩어리를 주면"
	cont "기절한 포켓몬도 깨어난다!"

	para "단지 파워포인트는"
	line "회복하지 않으니까 주의하도록!"
	done

BlackthornMartBlackBeltText:
	text "골드 스프레이는"
	line "약한 포켓몬이 접근하지 못하게한다"

	para "여러종류의 스프레이 중에서"
	line "제일 오래 쓸 수 있다!"
	done

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartCooltrainerMScript, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornMartBlackBeltScript, -1
