	const_def 2 ; object constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText:
; unused
	text "에구 에구……"
	line "내 딸이 없어졌단다"

	para "설마"
	line "불탄 탑에 갔단말인가?"

	para "그곳은 아이가 자주 행방불명되어서"
	line "가까이 가지말라고 말해뒀는데"
	cont "어떡게하면 좋단말인가……"
	done

EcruteakCityGramps1Text:
	text "인주시티에는 서쪽과 동쪽에"
	line "2개의 탑이 있었던 것 같은데……"
	done

EcruteakCityGramps2Text:
	text "허헛 어린"
	line "전통 무용수의 춤은 배웠는가"

	para "지금 무도장에 가면"
	line "이상한 아저씨에게서"
	cont "좋은 것을 얻을 수 있다고 한다"
	done

EcruteakCityLass1Text:
	text "이제부터 무도장에서"
	line "춤 연습을 할꺼야"
	cont "괜찮다면 너는 어떠니?"
	done

EcruteakCityLass2Text:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "3마리의 커다란 포켓몬"
	line "여기저기에 달려가 사라졌어"
	cont "무엇이었을까?"
	done

EcruteakCityFisherText:
	text "들은 이야기지만"
	line "담청시티의 등대……"

	para "어둠을 밝히는 포켓몬이"
	line "쓰러져버려서 큰 일인 것 같아"
	done

EcruteakCityFisherText_JasmineReturned:
	text "담청시티의 등대 포켓몬"
	line "병을 고쳤데"
	cont "이것으로 밤에 배가 다닐 수 있다"
	done

EcruteakCityYoungsterText:
	text "분노의 호수에서"
	line "포켓몬이 소동을 피우고 있데"
	cont "가보고싶어라"
	done

EcruteakCityGramps3Text:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #MON"
	line "perished in it."

	para "A rainbow-colored"
	line "#MON descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by ECRUTEAK"
	line "GYM LEADERS."

	para "Me?"

	para "I was a trainer"
	line "way back when."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "이곳은 인주시티"
	line "과거와 현재가"
	cont "동시에 흘러가는 역사의 마을"
	done

TinTowerSignText:
	text "방울탑"

	para "전설의 포켓몬이 내려온다고"
	line "전해지고 있습니다"
	done

EcruteakGymSignText:
	text "인주시티 포켓몬 체육관"
	line "관장 유빈"
	cont "천리안을 지닌 수도사"
	done

EcruteakDanceTheaterSignText:
	text "인주시티 무도장"
	line "올바른 지명은 예술극장"
	done

BurnedTowerSignText:
	text "불탄 탑"

	para "수수께끼의 큰 화재로 불탔습니다"
	line "위험하니까 가까이가지 마십시오"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	db 7 ; object events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
