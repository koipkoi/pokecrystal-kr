	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "엥 <PLAY_G>!"

	para "우리 남편"
	line "어쩐지 바쁜 것 같아도"
	cont "무리는 하고 있지 않겠지?"

	para "포켓몬 연구를 하게되면"
	line "푹 빠져서 식사도 하지 않는단다!"
	done

ElmsSonText:
	text "난 이다음에 크면"
	line "아버지를 도울꺼야!"

	para "그래서 훌륭한"
	line "포켓몬 박사가 될꺼다!"
	done

ElmsHouseLabFoodText:
; unused
	text "식사 준비가 되어 있군"
	line "연구소 몫인가?"
	done

ElmsHousePokemonFoodText:
; unused
	text "식사 준비가 되어 있다"
	line "이건 포켓몬 식사인가?"
	done

ElmsHousePCText:
	text "포켓몬은 어디서 와서"
	line "어디로 가는가?"

	para "어째서 태어나는 순간을"
	line "아무도 본 적이 없을까?"

	para "나는 그것을 알고싶어!"
	line "인생의 전부를 걸고"
	cont "연구할 작정이다!"

	para "…… …… ……"

	para "공박사님이 인정하고 있는"
	line "연구 발표의 일부다!"
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	db 2 ; object events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
