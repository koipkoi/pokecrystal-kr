	const_def 2 ; object constants
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CHERRYGROVECITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CHERRYGROVECITY_MEET_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	jump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	buttonsound
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveSilverSceneSouth:
	moveobject CHERRYGROVECITY_SILVER, 39, 7
CherrygroveSilverSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Totodile:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Chikorita:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	setscene SCENE_CHERRYGROVECITY_NOTHING
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	buttonsound
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd pokecentersign

CherrygroveCityMartSign:
	jumpstd martsign

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData:
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "너 신출내기 트레이너지?"
	line "급소를 찔렸지!"

	para "좋아 좋아"
	line "누구든지 처음은 있는 법"

	para "괜찮다면 내가"
	line "여러가지 가르쳐줄까?"
	done

GuideGentTourText1:
	text "좋아 확실하게 안내해주마!"
	done

GuideGentPokecenterText:
	text "이곳은 포켓몬 센터"
	line "상처입은 포켓몬을 맡기면"
	cont "눈깜짝할 사이에 치료해준단다!"

	para "지금부터 이후에 몇번이고"
	line "신세를 지게 되겠지"
	cont "기억해 두는 것이 좋을 것이다!"
	done

GuideGentMartText:
	text "이곳은 프렌들리 숍"
	line "포켓몬을 잡을 볼이라든지"
	cont "여러가지 품목을 팔고 있단다!"
	done

GuideGentRoute30Text:
	text "이 끝은 30번 도로!"
	line "모두 자랑하는 포켓몬을"
	cont "시합시키고 있단다!"
	done

GuideGentSeaText:
	text "이곳은 보는바와 같이 바다!"

	para "바다 속밖에 없는"
	line "포켓몬도 있지!"
	done

GuideGentGiftText:
	text "이곳은……"

	para "내 집이란다"
	line "상대해줘서 고맙다"

	para "이거 답례로 주마"
	done

GotMapCardText:
	text "<PLAYER>의 포켓기어로"
	line "지도를 볼 수 있게 되었다!"
	done

GuideGentPokegearText:
	text "포켓기어는"
	line "편리카드를 끼우면"
	cont "점점 편리해진단다!"

	para "그럼 힘내거라!"
	done

GuideGentNoText:
	text "그런가……"
	line "내 부탁이었는데……"
	cont "뭐 좋다싶은 생각이 들면 오너라"
	done

CherrygroveRivalText_Seen:
	text "…… …… ……"

	para "너 연구소에서"
	line "포켓몬을 얻었구나"
	cont "약해빠진 주제에 아깝게도"

	para "…… …… ……"

	para "뭐야 무엇을 말하고 있는지"
	line "모르겠냐"

	para "…… 그렇다면 할 수 없군"
	line "나도 좋은 포켓몬 가지고 있으니까"
	cont "어떤 말인지 가르쳐주지"
	done

SilverCherrygroveWinText:
	text "…… 흥!"
	line "이겨서 기쁘냐?"
	done

CherrygroveRivalText_YouLost:
	text "…… …… ……"

	para "내 이름은 ???"

	para "세계에서 제일 강한"
	line "포켓몬 트레이너가 될 사나이다"
	done

SilverCherrygroveLossText:
	text "…… 흥!"
	line "시간만 낭비한 것 같군"
	done

CherrygroveRivalText_YouWon:
	text "…… …… ……"

	para "내 이름은 ???"

	para "세계에서 제일 강한"
	line "포켓몬 트레이너가 될 사나이다"
	done

CherrygroveTeacherText_NoMapCard:
	text "포켓몬 센터 옆에 있는"
	line "할아버지의 이야기 들었니?"

	para "네가 가지고 있는 포켓기어로"
	line "성도지방의 마을지도가"
	cont "보이도록 해주신단다"
	done

CherrygroveTeacherText_HaveMapCard:
	text "포켓몬과 함께라면"
	line "어디에 가든지 즐겁단다"
	done

CherrygroveYoungsterText_NoPokedex:
	text "포켓몬 할아버지의 집"
	line "여기서부터 꽤 멀어"
	done

CherrygroveYoungsterText_HavePokedex:
	text "도로에 서 있는 트레이너랑"
	line "용감하게 싸웠는데……"

	para "내 포켓몬이 져서"
	line "상처를 많이 입었다……"
	cont "포켓몬 센터에 가지 않으면……"
	done

MysticWaterGuyTextBefore:
	text "요전에 낚은 포켓몬이"
	line "도구를 지니고 있었단다"

	para "신비의 물방울이라고 하는데"
	line "나는 포켓몬을 잡은 것 뿐이니까"
	cont "괜찮다면 네가 가지고 가거라"
	done

MysticWaterGuyTextAfter:
	text "그럼 또 낚시를 계속 해볼까"
	done

CherrygroveCitySignText:
	text "이곳은 무궁시티"
	line "아름다운 꽃의 향기가 그윽한 마을"
	done

GuideGentsHouseSignText:
	text "이곳은 안내 할아버지의 집"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	db 2 ; coord events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneSouth

	db 4 ; bg events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	db 5 ; object events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
