	const_def 2 ; object constants
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

Text_ClairIsOut:
	text "대단히 죄송합니다"

	para "체육관 관장님은 뒤쪽 동굴에서"
	line "수행을 하고 있습니다"

	para "돌아오시려면 언제쯤이나 될지……"
	done

Text_ClairIsIn:
	text "체육관 관장님이 기다리고 계십니다"

	para "하지만 보통의"
	line "실력으로는 이길 수 없을껍니다"
	done

Text_ClairIsBeaten:
	text "관장님께 이겼습니까?"
	line "그것 대단하군요……"

	para "그정도의 실력이라면"
	line "포켓몬 리그에서도 문제 없겠죠"
	done

BlackthornGrampsRefusesEntryText:
	text "이곳은 드래곤 조련사들만"
	line "수행을 허가받은 장소"
	cont "물러나 주십시오"
	done

BlackthornGrampsGrantsEntryText:
	text "드래곤 조련사의 우두머리"
	line "이향님이 인정하셨다면"
	cont "지나가도 좋습니다"
	done

BlackBeltText_WeirdRadio:
	text "라디오가 고장났나?"
	line "어째 요즘은 이상하네"
	cont "방송밖에 들리지않아"
	done

BlackBeltText_VoicesInMyHead:
	text "우왁"
	line "전파가 찌릿찌릿하다-!"

	para "응?"
	line "라디오 듣고 있어"
	done

BlackthornCooltrainerF1Text:
	text "너도"
	line "포켓몬의 기술을 잊게 시킬꺼니?"
	done

BlackthornYoungsterText:
	text "나도 이향님처럼"
	line "드래곤 조련사가 될꺼야!"
	done

MeetSantosText:
	text "토영『…… …… ……"

	para "나는 토요일의 토영……"
	done

SantosGivesGiftText:
	text "이거 ……"
	done

SantosGaveGiftText:
	text "토영『…… …… ……"

	para "저주의 부적……"

	para "고스트타입의 기술이 강해진다"
	line "네가 놀랄 정도로……"
	done

SantosSaturdayText:
	text "토영『…… …… ……"

	para "다음 토요일에"
	line "또 만나……"

	para "더 줄 물건은 없지만……"
	done

SantosNotSaturdayText:
	text "토영『오늘은 토요일이"
	line "아니야……"
	cont "…… …… …… …… ……"
	done

BlackthornCooltrainerF2Text:
	text "뭐!"
	line "얼음샛길을 지나서 왔다고!"

	para "너 포켓몬 트레이너로서"
	line "제법 뛰어난 솜씨를 지녔구나!!"
	done

BlackthornCitySignText:
	text "이곳은 검은먹시티"
	line "산골짜기에 머무는 조용한 마을"
	done

BlackthornGymSignText:
	text "검은먹시티 포켓몬 체육관"
	line "관장 이향"
	cont "성스러운 드래곤 포켓몬 조련사!"
	done

MoveDeletersHouseSignText:
	text "무엇이든 잊어먹어? 아저씨의 집"
	done

DragonDensSignText:
	text "이 끝은 용의 굴"
	done

BlackthornCityTrainerTipsText:
	text "득이 되는 게시판!"

	para "기적의 열매를 지니게 하고있으면"
	line "어떠한 특수 상태라도"
	cont "회복합니다!"
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	db 9 ; object events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
