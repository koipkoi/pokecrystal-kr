	const_def 2 ; object constants
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FINISHED
	checkcode VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "관동에 가서"
	line "실력을 겨룬단다!"
	done

CooltrainermSeanBeatenText:
	text "이기고싶었는데……!"
	done

CooltrainermSeanAfterBattleText:
	text "성도의 트레이너들도"
	line "관동의 체육관 관장과"
	cont "싸울 수 있으니까!"
	done

CooltrainerfCarolSeenText:
	text "나도 챔피언을"
	line "목표로 노력하고있어!"
	done

CooltrainerfCarolBeatenText:
	text "나랑 너는"
	line "무엇이 다른걸까……!?"
	done

CooltrainerfCarolAfterBattleText:
	text "언젠가 반드시"
	line "너에게 이기고말꺼야!"
	done

PokemaniacEthanSeenText:
	text "관동의 인기 DJ"
	line "리리스를 알고 있니?"
	done

PokemaniacEthanBeatenText:
	text "우악-!"
	done

PokemaniacEthanAfterBattleText:
	text "리리스도 좋지만"
	line "호두가 최고야!"
	cont "성도의 라디오를 듣고싶어!"
	done

HikerNolandSeenText:
	text "너 혼자니!?"
	line "그럼 포켓몬 승부다!"
	done

HikerNolandBeatenText:
	text "너무 강해!"
	done

HikerNolandAfterBattleText:
	text "나를 만족시킬만한"
	line "가파른 산이"
	cont "관동에도 있을까?"
	done

SailorStanlySeenText:
	text "어떻든 나는 선원이다!"
	line "그러나 게으름 피우는 건 아니야!"
	cont "아무도 없는 방이라서"
	cont "잠시 낮잠을 자고 있었어……!"

	para "에이!"
	line "포켓몬 승부다!"
	done

SailorStanlyBeatenText:
	text "미안!"
	line "내가 잘못했다!"
	done

SailorStanlyAfterBattleText:
	text "선원이란 직업은 힘을 쓰는 일"
	line "정말 지친단다……"
	done

GentlemanEdwardSeenText:
	text "움 곤란하군"
	line "중요한 것을 잃어버렸다"
	done

GentlemanEdwardBeatenText:
	text "차……"
	line "찾을 수가 없어……!"
	done

GentlemanEdwardAfterBattleText:
	text "할 수 없군! 포기할까"
	line "아- 너 너말야!"
	cont "찾지 않아도 좋아"
	cont "잊어줘!"
	done

BurglarCoreySeenText:
	text "이익!"
	line "럭키-!"
	done

BurglarCoreyBeatenText:
	text "진것은 "
	line "노 럭키!"
	done

BurglarCoreyAfterBattleText:
	text "예쁜 동전을"
	line "방에서 주웠어"

	para "전에 이 방을 쓰고있던"
	line "손님이 떨어뜨렸을까……?"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	db 7 ; object events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
