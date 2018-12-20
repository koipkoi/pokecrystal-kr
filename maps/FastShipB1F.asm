	const_def 2 ; object constants
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FashShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FashShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	buttonsound
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FashShipB1FTrashcan:
	jumpstd trashcan

FashShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FashShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "어이 어이 이봐 너"
	line "친구를 찾아주지 않겠니?"

	para "일을 땡땡이치고 어딘가 있을지"
	line "나원 참……!"

	para "나도 찾으러 가고싶지만"
	line "일을 해야해서……"
	done

FastShipB1FOnDutySailorRefusedText:
	text "큰일이군……"
	line "선장님께 크게 혼나겠어"
	done

FastShipB1FOnDutySailorThanksText:
	text "고마워!"
	line "땡땡이 치지 않도록"
	cont "확실히 못을 박아놨어!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "뭐 여자아이?"

	para "그러고보니까"
	line "이곳을 지나간 것 같아!"
	done

FastShipB1FOnDutySailorDirectionsText:
	text "이 다음은 식당이야"

	para "안쪽의 계단은 선장실에"
	line "연결되어있어"
	done

SailorJeffSeenText:
	text "일하는 사이에 휴식은"
	line "포켓몬 승부가 제일!"
	done

SailorJeffBeatenText:
	text "이기든 지든"
	line "휴식 종료-!"
	done

SailorJeffAfterBattleText:
	text "온힘을 기울이지 않으면"
	line "강해지지 못하는가……!?"
	done

PicnickerDebraSeenText:
	text "조금 심심하군!"
	line "나랑 승부할래?"
	done

PicnickerDebraBeatenText:
	text "히잉 강하잖아!"
	done

PicnickerDebraAfterBattleText:
	text "노랑시티……"
	line "무지개시티……"
	cont "관동지방에도 커다란 마을이"
	cont "많이 있다는 이야기야!"
	done

JugglerFritzSeenText:
	text "우읍!"
	line "배멀미 해버렸어요!"
	done

JugglerFritzBeatenText:
	text "더는 움직일 수 없습니다……"
	done

JugglerFritzAfterBattleText:
	text "배는 안되겠군……"
	line "이번은 리니어 기차에 타자……"
	done

SailorGarrettSeenText:
	text "이곳은 우리들 선원의"
	line "신성한 일터다!"
	done

SailorGarrettBeatenText:
	text "홈 그라운드에서"
	line "져버렸다!"
	done

SailorGarrettAfterBattleText:
	text "갈색시티에서 담청시티까지 갈 때는"
	line "손님들의 진용이"
	cont "바뀌어 있단다!"
	done

FisherJonahSeenText:
	text "배에 타도 낚시는 할수없구"
	line "따분하다 승부나 하자!"
	done

FisherJonahBeatenText:
	text "따"
	line "따분함은 싹 가셨다……"
	done

FisherJonahAfterBattleText:
	text "갈색시티의 삼다리에서"
	line "낚시를 즐겨야지 하고 생각해서!"
	done

BlackbeltWaiSeenText:
	text "우오-옷!"
	line "배의 흔들림에 견디는 것으로"
	cont "팔다리를 단련합니닷! "
	done

BlackbeltWaiBeatenText:
	text "우오-옷!"
	line "떼굴떼굴!"
	done

BlackbeltWaiAfterBattleText:
	text "성도지방에서 수행하는"
	line "태권왕과 만나지 못했어요"

	para "어딘가의 동굴에서"
	line "수행하고 있틀텐데……"
	done

SailorKennethSeenText:
	text "나는 선원!"

	para "하지만 챔피언을 목표로"
	line "포켓몬 특훈중!"
	done

SailorKennethBeatenText:
	text "연습부족은 숨길 수 없다!"
	done

SailorKennethAfterBattleText:
	text "……혹시 8개의 배지는"
	line "체육관 관장에게 이긴 증거?"

	para "과연 강하군!"
	done

TeacherShirleySeenText:
	text "나의 학생들에게"
	line "손대지마!"
	done

TeacherShirleyBeatenText:
	text "꺄앗!"
	done

TeacherShirleyAfterBattleText:
	text "도라지시티의"
	line "유적 견학을 간다"
	done

SchoolboyNateSeenText:
	text "이봐"
	line "알프의 유적에 대해 알고 있니?"
	done

SchoolboyNateBeatenText:
	text "우와-악!"
	done

SchoolboyNateAfterBattleText:
	text "유적 안에서 라디오를 들으면"
	line "이상한 소리가 들린다고 해"
	done

SchoolboyRickySeenText:
	text "알프의 유적에"
	line "이상한 석판이 있다고 한다!"
	done

SchoolboyRickyBeatenText:
	text "당했다!"
	done

SchoolboyRickyAfterBattleText:
	text "책에서 읽었는데"
	line "석판은 4개가 있다고 한다!"
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	db 2 ; coord events
	coord_event 30,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksRight

	db 1 ; bg events
	bg_event 27,  9, BGEVENT_READ, FashShipB1FTrashcan

	db 12 ; object events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
