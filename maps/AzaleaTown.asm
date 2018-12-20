	const_def 2 ; object constants
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_SILVER
	const AZALEATOWN_AZALEA_ROCKET3
	const AZALEATOWN_KURT_OUTSIDE

AzaleaTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return

AzaleaTownRivalBattleScene1:
	moveobject AZALEATOWN_SILVER, 11, 11
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement1
	turnobject PLAYER, DOWN
	jump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement2
	turnobject PLAYER, UP
AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Totodile:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_SILVER
	setscene SCENE_AZALEATOWN_NOTHING
	waitsfx
	playmapmusic
	end

AzaleaTownRocket1Script:
	jumptextfaceplayer AzaleaTownRocket1Text

AzaleaTownRocket2Script:
	jumptextfaceplayer AzaleaTownRocket2Text

AzaleaTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

UnusedWoosterScript:
; unused
	faceplayer
	opentext
	writetext WoosterText
	cry QUAGSIRE
	waitbutton
	closetext
	end

AzaleaTownCelebiScene:
	applymovement PLAYER, AzaleaTownPlayerLeavesKurtsHouseMovement
	opentext
	writetext AzaleaTownKurtText1
	buttonsound
	turnobject AZALEATOWN_KURT_OUTSIDE, RIGHT
	writetext AzaleaTownKurtText2
	buttonsound
	writetext AzaleaTownKurtText3
	waitbutton
	verbosegiveitem GS_BALL
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOTHING
	closetext
	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	writetext AzaleaTownKurtText3
	waitbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd pokecentersign

AzaleaTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

AzaleaTownRivalBattleApproachMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

AzaleaTownPlayerLeavesKurtsHouseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end

AzaleaTownRivalBeforeText:
	text "…… 물어보고 싶은 것이 있다"
	
	para "…… 로켓단이"
	line "부활했다는 것이 정말이냐?"
	
	para "뭐 네가 쓰러뜨렸다고?"
	line "거짓말 하지마"
	
	para "…… 진짜야?"
	line "그럼 그 실력을"
	cont "나에게 보여줘 봐"
	done

AzaleaTownRivalWinText:
	text "…… 흥!"
	line "쓸모 없는 포켓몬이군!"
	
	para "…… 네가 이긴 것은"
	line "내 포켓몬이 약했기 때문이다"
	done

AzaleaTownRivalAfterText:
	text "…… 나는 약한 녀석을"
	line "제일 싫어한다"
	
	para "포켓몬이든"
	line "트레이너든……"
	
	para "그런 약한 녀석들을"
	line "전부 쓸어버리기 위해"
	cont "나는 강해질테다……"
	
	para "로켓단도 똑같아"
	
	para "한명 한명으로는 약한 주제에"
	line "모여서 잘난 채하는 녀석들은"
	cont "절대로 용서 못해"
	
	para "…… 너는 방해하지마"
	line "약한 녀석이 어슬렁거리면"
	cont "눈에 거슬리니까"
	done

AzaleaTownRivalLossText:
	text "…… 흥!"
	line "역시 아까한 말 거짓이지?"
	done

AzaleaTownRocket1Text:
	text "안쪽은 위험하니까"
	line "이렇게 아무도 들어갈 수 없도록"
	cont "지키고 있어요"
	
	para "크으- 나는 착한 사람?"
	done

AzaleaTownRocket2Text:
	text "너 야돈의 꼬리라는 것 알고있니?"
	line "소문으로는 맛있다는 것 같아"
	
	para "이런 좋은 것을 가르쳐주다니"
	line "크으- 나는 좋은 사람?"
	done

AzaleaTownGrampsTextBefore:
	text "마을에서 야돈이 사라졌다……"
	
	para "어디에선가는 야돈의 꼬리가"
	line "팔리고 있다는 이야기가 있고……"
	done

AzaleaTownGrampsTextAfter:
	text "야돈이 돌아왔어"
	line "아무튼 느긋한 야돈이라서"
	cont "어딘가 느긋하게 지내다가 왔을지도"
	done

AzaleaTownTeacherText:
	text "너도 강집 할아버지에게"
	line "볼을 만들어달라고 왔니?"
	cont "그렇게 말하는 사람 많은 것 같아"
	done

AzaleaTownYoungsterText:
	text "고동마을을 빠져 나오면"
	line "너도밤나무 숲"
	
	para "그치만 작은 나무가 방해를 해서"
	line "앞으로 나갈 수가 없어"
	
	para "숯 전문가의 포켓몬이라면"
	line "나무 자르는 기술을 알텐데"
	done

AzaleaTownSlowpokeText1:
	text "야돈『…… …… ……"
	
	para "…… …… ……"
	done

AzaleaTownSlowpokeText2:
	text "…… …… 야아-돈?"
	done

WoosterText:
	text "수어『……교오-"
	done

AzaleaTownKurtText1:	
	text "너도밤나무숲이 술렁거리고 있다!"
	line "이게 무슨 일이야!"
	done

AzaleaTownKurtText2:	
	text "<PLAYER>!"
	line "GS볼은 돌려주마!"
	done

AzaleaTownKurtText3:	
	text "너도밤나무숲이 술렁거리고 있다"
	line "원인을 알아내주지 않겠나?"
	done

AzaleaTownSignText:
	text "이곳은 고동마을"
	line "포켓몬과 사람들이"
	cont "함께 사이좋게 살아가는 마을"
	done

KurtsHouseSignText:
	text "이곳은 강집의 집"
	done

AzaleaGymSignText:
	text "고동마을 포켓몬 체육관"
	line "관장 호일"
	cont "벌레포켓몬 만물박사"
	done

SlowpokeWellSignText:
	text "야돈의 우물"
	line "다른 이름은 비를 내리는 우물"
	
	para "이 지방에서는"
	line "야돈이 하품을 할 때"
	cont "비가 내린다고 믿고 있어요"
	
	para "실제로 400년 전의"
	line "가뭄 때 모두를 구한 것은"
	cont "야돈이 하품을 했기 때문이라고"
	cont "당시의 기록이 남아 있습니다"
	done

CharcoalKilnSignText:
	text "이곳은 숯 전문가의 집"
	done

AzaleaTownIlexForestSignText:
	text "게이트를 나서면 너도밤나무 숲"
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	db 3 ; coord events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene2
	coord_event  9,  6, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL, AzaleaTownCelebiScene

	db 9 ; bg events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	db 12 ; object events
	object_event 31,  9, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket1Script, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 11, 10, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 10, 16, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket2Script, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6,  5, SPRITE_KURT_OUTSIDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
