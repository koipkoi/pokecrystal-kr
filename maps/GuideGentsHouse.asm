	const_def 2 ; object constants
	const GUIDEGENTSHOUSE_GRAMPS

GuideGentsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseBookshelf:
	jumpstd magazinebookshelf

GuideGentsHouseGuideGentText:
	text "나도 젊었을 때에는"
	line "힘찬 트레이너였단다!"

	para "그런 나로부터의 어드바이스!"
	line "포켓몬은 많이 잡아라!"

	para "그리고 온화함을 지니고"
	line "포켓몬을 대해주는 것이다!"
	done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
