	const_def 2 ; object constants
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BUENA
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	special Mobile_DummyReturnFalse
	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .ArrivedOlivine
	opentext
	writetext FastShipArrivedVermilionText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	opentext
	writetext FastShipArrivedOlivineText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd trashcan

FirebreatherLyleSeenText:
	text "관동에 가서"
	line "화염의 퍼포먼스를"
	cont "취할 것이다!"
	done

FirebreatherLyleBeatenText:
	text "투덜 투덜……"
	line "불꽃이 작아……"
	done

FirebreatherLyleAfterBattleText:
	text "역시 바다 위에서는"
	line "불꽃이 약한걸까……"

	para "관계없어?"
	line "그러니?"
	done

BugCatcherKenSeenText:
	text "할머니댁에 가서"
	line "곤충채집 할꺼다!"
	done

BugCatcherKenBeatenText:
	text "우와!"
	line "강하구나 형은!"
	done

BugCatcherKenAfterBattleText:
	text "성도의 나무에는"
	line "많은 포켓몬이 있단다!"
	done

BeautyCassieSeenText:
	text "포켓몬 승부로"
	line "슬픔을 잊게만들지"
	cont "상대해주겠어?"
	done

BeautyCassieBeatenText:
	text "내 마음이 울고 있어……"
	done

BeautyCassieAfterBattleText:
	text "실연의 슬픔을 고치기에는"
	line "배를 타는 여행이 최고이지만……"

	para "쾌속선은 너무 빨라서"
	line "정취가 없어!"
	done

GuitaristClydeSeenText:
	text "금빛시티의 라디오 방송국에"
	line "노래를 알려나가는 것이다!"
	done

GuitaristClydeBeatenText:
	text "띠리링!"
	done

GuitaristClydeAfterBattleMobileText:
	text "나는 배틀 타워에 가서"
	line "나의 꿈을 이룰거야!"

	para "그러기 위해선"
	line "갈색시티로 가야되……"
	done

GuitaristClydeAfterBattleText:
	text "라디오 방송국이라고 하면"
	line "오늘의 럭키채널의"
	cont "당첨 번호는 무엇일까……"
	done

FastShipBedText1:
	text "푹신푹신 침대다!"
	line "느긋하게 쉬자……"
	done

FastShipBedText2:
	text "완전히 활기를 되찾았다!"
	done

FastShipArrivedOlivineText:
	text "쾌속선 아쿠아호는"
	line "담청항에 도착했습니다!"
	done

FastShipArrivedVermilionText:
	text "쾌속선 아쿠아호는"
	line "갈색항에 도착했습니다!"
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	db 4 ; object events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
