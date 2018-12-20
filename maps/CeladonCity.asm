	const_def 2 ; object constants
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "이녀석은 나의 파트너"
	line "강챙이!"

	para "이녀석도 언젠가는"
	line "개구리포켓몬이 될까?"
	done

CeladonCityPoliwrathText:
	text "강챙이『강챙 강챙!"
	done

CeladonCityTeacher1Text:
	text "아잉!"
	line "슬롯머신에서 또 잃었다!"

	para "최근엔 여자들도"
	line "슬롯머신에 푹 빠졌단다!"
	cont "너도 한번 해보지 그러니?"
	done

CeladonCityGramps1Text:
	text "요즘들어 질퍽이가"
	line "출몰하게 되었단다"

	para "저기 집 앞의 연못에도"
	line "질퍽이가 있잖니!"

	para "어디서 왔을까?"
	line "곤란하구나……"
	done

CeladonCityGramps2Text:
	text "으하하! 여기 체육관은 좋구나!"
	line "여자아이들만 있어서!"
	done

CeladonCityYoungster1Text:
	text "내 비밀 가르쳐줄께"

	para "사실은 무지개 맨션에"
	line "비밀의 숨겨진 문이 있단다!"
	done

CeladonCityYoungster2Text:
	text "그 식당에서"
	line "많이먹기 대회를 한다는데……"
	cont "보는 것 만으로도 배불러……!"
	done

CeladonCityTeacher2Text:
	text "무지개 백화점은"
	line "상품구색이 넘버원이야!"
	cont "원하는 것은 무엇이든 살수 있어!"

	para "……엣 내가"
	line "판매사원처럼 보이잖아!"
	done

CeladonCityLassText_Mobile:
; unused
	text "I love being"
	line "surrounded by tall"
	cont "buildings!"

	para "Isn't it true that"
	line "GOLDENROD #MON"

	para "CENTER was made"
	line "much, much bigger?"

	para "That is so neat!"
	line "I wish we had a"

	para "place like that in"
	line "KANTO…"
	done

CeladonCityLassText:
	text "…… 도로의 모양을"
	line "계속 주시하면서 걸어가니까"
	cont "눈이 따끔따끔해졌어!"
	done

CeladonCitySignText:
	text "이곳은 무지개시티"
	line "무지개는 총천연색 꿈의 색깔"
	done

CeladonGymSignText:
	text "무지개시티 포켓몬 체육관"
	line "관장 민화"
	cont "자연을 사랑하는 아가씨"
	done

CeladonCityDeptStoreSignText:
	text "원하는 것은 꼭 있습니다!"
	line "무지개 백화점"
	done

CeladonCityMansionSignText:
	text "무지개 맨션"
	done

CeladonCityGameCornerSignText:
	text "이곳은 모두의 놀이장소"
	line "무지개 게임코너"
	done

CeladonCityTrainerTipsText:
	text "…… 득이 되는 게시판"

	para "이펙트 가드는"
	line "불꽃이랑 물 전기등의"

	para "특수 공격으로부터"
	line "포켓몬을 지켜준다!"

	para "도구의 쇼핑천국"
	line "무지개 백화점으로 오세요!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	db 9 ; object events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
