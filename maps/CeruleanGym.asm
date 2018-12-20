ce	const_def 2 ; object constants
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUY

CeruleanGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CERULEANGYM_NOTHING
	scene_script .GruntRunsOut ; SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	db 0 ; callbacks

.DummyScene0:
	end

.GruntRunsOut:
	priorityjump .GruntRunsOutScript
	end

.GruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOTHING
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOTHING
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	waitbutton
	closetext
	end

.CeruleanGymGuyWinScript:
	writetext CeruleanGymGuyWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MISTY, MISTY1, MEM_BUFFER_1
	jumpstd gymstatue2

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "오우! 쏘리!"
	line "유 상처 낫씽입니까?"
	cont "나는 베리 비지해요!"
	cont "유랑 천천히 토킹"
	cont "할 수 없어요!"
	cont "누군가에게 발견되면"
	cont "난 골란해지니까요!"
	done

CeruleanGymGruntBigMistakeText:
	text "……오- 노-!"
	line "이미 유에게 들켜버렸네요!"
	cont "빅 마이 미스테이크!"
	done

CeruleanGymGruntByeText:
	text "헤이 유!"
	line "이 일에대해 포겟 해야해!"
	cont "유는 아무것도 못 봤다"
	cont "듣지도 않고 모르는거다!"

	para "바이 키드!"
	line "롱 굿바이!"
	done

CeruleanGymNote1Text:
	text "잠시 외출합니다"
	line "…… 체육관 관장 이슬"
	done

CeruleanGymNote2Text:
	text "이슬이가 없어서"
	line "놀러 다녀오겠습니다"
	cont "…… 체육관 트레이너 일동"
	done

MistyIntroText:
	text "이슬『왔구나!"
	line "방해꾼 나으리!"

	para "성도의 체육관 배지를"
	line "많이 가지고 있어 보이지만"
	cont "나를 얕보다간 큰 코 다칠껄"

	para "내 물타입의 포켓몬은"
	line "무척 강하다구!"
	done

MistyWinLossText:
	text "이슬『꽤 하는군……"

	para "너의 실력"
	line "마음을 비우고 받아들이지……"

	para "자 이거"
	line "블루배지야!"
	done

ReceivedCascadeBadgeText:
	text "<PLAYER>는(은) 이슬이로부터"
	line "블루배지를 얻었다!"
	done

MistyFightDoneText:
	text "이슬『강한 트레이너가"
	line "성도에는 많이 있니?"
	cont "너처럼"

	para "나도 언젠가 여행을 떠나서"
	line "강한 트레이너랑 싸울꺼야!"
	done

SwimmerfDianaSeenText:
	text "미안 부재중이어서"
	line "그럼 바로 승부에 들어갈까!"
	done

SwimmerfDianaBeatenText:
	text "아잉 몰라!"
	line "내가 졌어!"
	done

SwimmerfDianaAfterBattleText:
	text "우아하게 헤엄치고 있습니다"
	done

SwimmerfBrianaSeenText:
	text "나의 화려한"
	line "헤엄치기를 보고 놀라지마세요!"
	done

SwimmerfBrianaBeatenText:
	text "전혀 놀라지 않는군……"
	line "엄청 냉정하네……!"
	done

SwimmerfBrianaAfterBattleText:
	text "나를 쓰러뜨렸다고해서"
	line "안심하지 마라"
	cont "이슬이는 정말 강하니까!"
	done

SwimmermParkerSeenText:
	text "어푸!"

	para "먼저 내가 상대다!"
	line "덤벼라!"
	done

SwimmermParkerBeatenText:
	text "이럴리 없는데"
	done

SwimmermParkerAfterBattleText:
	text "이슬이는 요 근래 수년동안"
	line "점점 강해졌단다!"
	cont "방심하지말거라"
	cont "혼쭐이 날테니까!"
	done

CeruleanGymGuyText:
	text "야아-!"
	line "미래의 챔피언!"

	para "이슬이가 없어서"
	line "우리들도 놀러 갔었단다"
	cont "와하하하핫!"
	done

CeruleanGymGuyWinText:
	text "역시 강하구나!"
	line "좋은 시합이었어!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	db 6 ; object events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
