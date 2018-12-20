	const_def 2 ; object constants
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE

FuchsiaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityYoungsterText:
	text "지금의 사천왕중의 한사람은"
	line "연분홍시티 체육관의"
	cont "체육관 관장이었단다!"
	done

FuchsiaCityPokefanMText:
	text "현재 체육관 관장은"
	line "사천왕이 되었다"
	cont "독수님의 따님이란다!"
	done

FuchsiaCityTeacherText:
	text "사파리존은 휴업중"
	line "연분홍시티의 명소이기때문에"
	cont "약간은 슬퍼……"
	done

FuchsiaCitySignText:
	text "이곳은 연분홍시티"
	line "연분홍은 핑크빛의 화려한 색깔"
	done

FuchsiaGymSignText:
	text "연분홍시티 포켓몬 체육관"
	line "관장 도희"
	cont "독에관한 것이라면 무엇이든 최고"
	done

SafariZoneOfficeSignText:
	text "……전단지가 붙어있다"

	para "사파리존 사무국은"
	line "휴업중입니다"
	done

WardensHomeSignText:
	text "사파리존"
	line "원장의 집"
	done

SafariZoneClosedSignText:
	text "사파리존의 원장님이"
	line "아주 먼 나라에 여행을 떠나서"
	cont "쉬고있습니다"
	done

NoLitteringSignText:
	text "쓰레기 투기 금지"
	line "쓰레기는 가지고 돌아가주세요"
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 35, ROUTE_19_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneClosedSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign

	db 4 ; object events
	object_event 23, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event  8,  1, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
