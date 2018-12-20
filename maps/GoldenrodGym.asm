	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_BUENA2
	const GOLDENRODGYM_GYM_GUY

GoldenrodGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_NOTHING
	scene_script .DummyScene1 ; SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	buttonsound
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOTHING
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuyWinScript
	opentext
	writetext GoldenrodGymGuyText
	waitbutton
	closetext
	end

.GoldenrodGymGuyWinScript:
	opentext
	writetext GoldenrodGymGuyWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "네-에!"
	line "내가 바로 꼭두!!"

	para "모두 포켓몬 하고 있잖아"
	line "나도 시작해보니까"
	cont "뭐- 엄청 귀여워서!"

	para "으-응 도전할꺼니?"
	line "말해두겠는데 나"
	cont "엄청 강하단다!"
	done

WhitneyShouldntBeSoSeriousText:
	text "우우……"

	para "…… 으앙!!"
	line "너무해 너무하다구!!"

	para "상대 못하겠어!!"
	line "꼬마니까……"
	done

WhitneyYouMeanieText:
	text "와앙!!"

	para "와-앙!!"

	para "…… 훌쩍 훌쩍"
	line "…… 너무해!!"
	done

WhitneyWhatDoYouWantText:
	text "……훌쩍"

	para "뭐야? 아직 뭔가 남았어?"
	line "아아 배지?"

	para "미안해 까먹었었어"
	line "자 레귤러배지"
	cont "이거 말이지!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER>는(은) 꼭두로부터"
	line "레귤러배지를 받았다!"
	done

WhitneyPlainBadgeText:
	text "레귤러배지를 가지고 있으면"
	line "싸우지 않을 때에도"
	cont "괴력의 기술을 쓸 수 있고"
	cont "포켓몬의 스피드도 빨라진단다"

	para "또 이것도 줄께!"
	done

WhitneyAttractText:
	text "내용물은 헤롱헤롱이라고 해"
	line "포켓몬의 매력을"
	cont "최대한 사용하는 기술이야"
	cont "귀여운 나한테 딱 어울리지?"
	done

WhitneyGoodCryText:
	text "후우!"
	line "울고나니까 후련해졌다!"

	para "그럼 또 놀러와!"
	line "바이바이!"
	done

LassCarrieSeenText:
	text "Don't let my"
	line "#MON's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCarrieBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

LassCarrieAfterBattleText:
	text "Do my #MON"
	line "think I'm cute?"
	done

LassBridgetSeenText:
	text "강한 포켓몬 보다"
	line "귀여운 포켓몬을 좋아해!"

	para "하지만 내가 가지고 있는 것은"
	line "강하고 귀여운 포켓몬이야!"
	done

LassBridgetBeatenText:
	text "아앙- 안 되는군!"
	done

LassBridgetAfterBattleText:
	text "꼭두에게 이기려고"
	line "열심히 하는데 아직 멀었을까"
	cont "어쩐지 자신이 없어져……"

	para "라고 하다니"
	line "지면 다음에 또 열심히하면 되지!"
	done

BridgetWhitneyCriesText:
	text "아-아 꼭두를"
	line "울게만들었군"

	para "괜찮아!"
	line "이제 곧 울음을 그칠테니까"
	cont "지면 언제나 운단다"
	done

BeautyVictoriaSeenText:
	text "음 귀여운 트레이너네!"
	line "누님께서 맘에 들었다!"
	cont "하지만 봐주지는 않을꺼다!"
	done

BeautyVictoriaBeatenText:
	text "에-그럼……"
	line "엥 끝났냐?"
	done

BeautyVictoriaAfterBattleText:
	text "누나에게 이기다니"
	line "대단해 대단해!"
	cont "그 상태로 열심히 해라"
	done

BeautySamanthaSeenText:
	text "전력을 다하지 않으면"
	line "병원에 입원하게 될꺼야!"
	done

BeautySamanthaBeatenText:
	text "아-야!!"
	line "미안해 나의 나옹아"
	done

BeautySamanthaAfterBattleText:
	text "어떤 타입의 포켓몬도"
	line "공격할 수 있도록"
	cont "기술을 가르쳤는데"
	done

GoldenrodGymGuyText:
	text "여어!"
	line "미래의 챔피언!"

	para "이 체육관은"
	line "노말타입 포켓몬의"
	cont "조련사들이 모여 있단다!"

	para "싸우게 한다고 하면"
	line "격투타입의"
	cont "포켓몬이 추천감이다!"
	done

GoldenrodGymGuyWinText:
	text "이겼니? 그것 참 잘 되었구나!"
	line "나는 여자아이에게 걸었었단다"
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	db 1 ; coord events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	db 2 ; bg events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	db 6 ; object events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1
