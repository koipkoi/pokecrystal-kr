	const_def 2 ; object constants
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	priorityjump EcruteakGymClosed
	end

.DummyScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd gymstatue2

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "잘 왔구나"

	para "인주시티에서는"
	line "옛날부터 포켓몬을"
	cont "신으로서 받들고 있었다"

	para "그리고 진정한 실력을 가진"
	line "트레이너 앞에"

	para "무지개 빛의 포켓몬이 날아온다……"
	cont "그렇게 전해지고 있다"

	para "나는 그 전설을 믿고"
	line "태어나서부터 지금까지 계속 여기서"
	cont "비밀의 수행을 하고 있다"

	para "그 덕분에"
	line "다른 사람에게는 보이지 않는 것도"
	cont "볼 수 있도록 되었다"

	para "이제 조금……"

	para "머지않아서"
	line "전설의 포켓몬과 만날 수 있다"
	cont "그런 미래가 보이는 것 같다"

	para "그것을 위한 수행"
	line "너에게도"
	cont "협력을 부탁하고 싶구나"
	done

MortyWinLossText:
	text "아직도 부족한 것인가"

	para "알겠다"
	line "이 배지는 너의 것이다!"
	done

Text_ReceivedFogBadge:
	text "<PLAYER>는(은) 유빈에게서"
	line "팬텀배지를 받았다!"
	done

MortyText_FogBadgeSpeech:
	text "팬텀배지를 가지고 있으면"
	line "레벨 50까지의 포켓몬이라면"
	cont "어떤 포켓몬이라도 너를 따른다"

	para "또 파도타기라는"
	line "기술을 사용할 수 있게된다"

	para "그리고 이것도 주마"
	done

MortyText_ShadowBallSpeech:
	text "내용물은 새도우볼"

	para "그냥 공격 하는 것만이 아니라"
	line "가끔은 특수방어를 물리치기도 한다"

	para "마음에 들면 사용해도 좋아"
	done

MortyFightDoneText:
	text "그런가"

	para "너는 여러곳을 모험해서"
	line "내가 모르는 것을"
	cont "여러가지 보고왔구나……"

	para "그것도 부러워"
	done

SageJeffreySeenText:
	text "포켓몬과 함께 봄을 지내고"
	line "여름부터 가을 그리고 겨울"
	cont "그리고 또 봄이 오고……"

	para "그렇게 해서 우리들은 계속"
	line "포켓몬이랑 지내왔어요"
	done

SageJeffreyBeatenText:
	text "승리도 패배도"
	line "많이 있었습니다"
	done

SageJeffreyAfterBattleText:
	text "포켓몬은 어디서 왔을까"
	done

SagePingSeenText:
	text "우리들의 포켓몬에게"
	line "데미지를 줄 수 있을까?"
	done

SagePingBeatenText:
	text "오오 제법!"
	done

SagePingAfterBattleText:
	text "우리들이 꺼낼 포켓몬은"
	line "고스트타입뿐"

	para "노말타입의 공격으로는"
	line "데미지를 줄 수 없다!"
	done

MediumMarthaSeenText:
	text "이 이겻!!"
	done

MediumMarthaBeatenText:
	text "져 졌다!"
	done

MediumMarthaAfterBattleText:
	text "마지막은 이기고싶다는"
	line "마음이 강한 쪽이 이긴다!"
	done

MediumGraceSeenText:
	text "보이지 않는 마루에서 허둥대지마라"
	line "나에게 이긴다면"
	cont "좋은 것을 가르쳐주마!"
	done

MediumGraceBeatenText:
	text "이이 이럴 수가!"
	done

MediumGraceAfterBattleText:
	text "좋다"
	line "보이지않는 마루의 비밀을 알려주마"

	para "우리들의 눈 앞"
	line "그곳에 길은 있다!"
	done

EcruteakGymGuyText:
	text "이곳의 트레이너들은"
	line "비밀의 목적이 있어서"
	cont "수행을 계속하고 있다고 한다"

	para "이기면 인주시티의 비밀에 대해"
	line "뭔가 가르쳐줄지도 모르지"
	done

EcruteakGymGuyWinText:
	text "우와-<PLAYER>"
	line "잘 이겼구나!"

	para "나 같은건 무서워서"
	line "구석에 숨어서 떨고 있었어"
	done

EcruteakGymClosedText:
	text "MORTY, the GYM"
	line "LEADER, is absent."

	para "Sorry, but you'll"
	line "have to leave."

	para "Hohohoho."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	db 7 ; object events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
