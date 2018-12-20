	const_def 2 ; object constants
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFloria
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	return

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext UnknownText_0x199042
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext UnknownText_0x199090
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x1990ce
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext UnknownText_0x199107
	waitbutton
	closetext
	end

.TeachMove:
	writetext UnknownText_0x19913a
	buttonsound
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext UnknownText_0x19918b
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x1991ac
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	buttonsound
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd pokecentersign

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

MovementData_0x198a5f:
	step RIGHT
	step RIGHT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "이곳은 탑이 낡아서"
	line "쓰러질 것 처럼 된 것을"
	cont "최신 라디오 방송국으로 만들었단다"
	done

GoldenrodCityYoungster1Text:
	text "자전거 가게가 새로 생겼는데"
	line "어디에 있지?"
	cont "전혀 어디 있는지 찾을 수 없네"
	done

GoldenrodCityCooltrainerF1Text:
	text "그 검은색 투성의 사람들"
	line "로켓단의 흉내를 내고 있는걸까?"
	cont "괴상한 사람들!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "그 검은색 투성의 사람들"
	line "정말 로켓단이었어?"
	cont "지금도 믿지 못하겠네"
	done

GoldenrodCityCooltrainerF2Text:
	text "금빛시티라고 하면 라디오타워"

	para "지금이라면 캠페인에서"
	line "포켓기어로 라디오를 들을 수 있게"
	cont "서비스를 받을 수 있데!"
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "와아 너의 포켓기어"
	line "라디오를 들을 수 있구나!"
	done

GoldenrodCityYoungster2Text:
	text "헤헤헤……"
	line "백화점의 지하 창고에서"
	cont "숨바꼭질을 하다가 혼났어"
	done

GoldenrodCityLassText:
	text "그쪽 집에서"
	line "포켓몬의 이름으로"
	cont "점을 쳐준단다"

	para "포켓몬에게 좋은 이름을"
	line "다시 지어주는 것도 가능하데"
	done

GoldenrodCityGrampsText:
	text "그런데 엄청 큰 마을이구나!"
	line "너무 넓어서 무엇이 있나"
	cont "전혀 모르겠구나"
	done

GoldenrodCityRocketScoutText1:
	text "여기가 라디오타워인가……"
	done

GoldenrodCityRocketScoutText2:
	text "뭐야 임마 너 저리 꺼져!"
	done

GoldenrodCityRocket1Text:
	text "어이 어슬렁거리지마!"
	line "방해하지 말라고!"
	done

GoldenrodCityRocket2Text:
	text "라디오타워를 빼앗아서……"

	para "뭐야!"
	line "꼬맹이에게는 관계 없다!"
	done

GoldenrodCityRocket3Text:
	text "포켓몬?"
	line "돈벌이에 사용하는 도구잖아!"
	done

GoldenrodCityRocket4Text:
	text "이제 곧 우리들의 야망이……"
	line "여기까지 오는데 참 길었군……"
	done

GoldenrodCityRocket5Text:
	text "임마!"
	line "꼬맹이가 무슨 용무냐!?"
	cont "저리 꺼져!"
	done

GoldenrodCityRocket6Text:
	text "너도 로켓단의"
	line "무서움을 아는 것이 좋을꺼다"
	done

GoldenrodCityStationSignText:
	text "이곳은 금빛시티 역"
	done

GoldenrodCityRadioTowerSignText:
	text "금빛시티 라디오타워"
	done

GoldenrodDeptStoreSignText:
	text "포켓몬 제품이라면"
	line "무엇이든지 있는 금빛시티 백화점"
	done

GoldenrodGymSignText:
	text "금빛시티 포켓몬 체육관"
	line "관장 꼭두"
	cont "다이너마이트 프리티 걸!"
	done

GoldenrodCitySignText:
	text "이곳은 금빛시티"
	line "휘황찬란"
	cont "금빛빤짝 생기 있는 아름다운 마을"
	done

GoldenrodCityBikeShopSignText:
	text "어느 곳이든 씽씽!"

	para "자전거에 대한 것이라면"
	line "여기 미라클 싸이클로!"
	done

GoldenrodCityGameCornerSignText:
	text "모두의 유락시설!"
	line "…… 금빛시티 게임코너"
	done

GoldenrodCityNameRaterSignText:
	text "이곳은 작명가의 집"
	line "포켓몬의 이름으로 점을 봅니다"
	done

GoldenrodCityUndergroundSignNorthText:
	text "여기서부터 지하통로"
	done

GoldenrodCityUndergroundSignSouthText:
	text "여기서부터 지하통로"
	done

GoldenrodCityPokeComCenterSignText:
; unused
	text "이곳은 포켓몬 커뮤니티 센터"
	line "뭐든 모바일 멋진 커뮤니티!"
	done

GoldenrodCityFlowerShopSignText:
	text "이곳은 금빛 플라워숍"
	line "아름다움을 당신에게 줍니다"
	done

UnknownText_0x199042:
	text "I can teach your"
	line "#MON amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

UnknownText_0x199090:
	text "It will cost you"
	line "4000 coins. Okay?"
	done

UnknownText_0x1990b4:
	text "Aww… But they're"
	line "amazing…"
	done

UnknownText_0x1990ce:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

UnknownText_0x199107:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

UnknownText_0x19913a:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

UnknownText_0x19918b:
	text "Wahahah!"
	line "Farewell, kid!"
	done

UnknownText_0x1991a4:
	text "B-but…"
	done

UnknownText_0x1991ac:
	text "…You don't have"
	line "enough coins here…"
	done

UnknownText_0x1991cf:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	db 0 ; coord events

	db 12 ; bg events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	db 15 ; object events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
