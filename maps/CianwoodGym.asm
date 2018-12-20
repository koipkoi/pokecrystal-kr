	const_def 2 ; object constants
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	checkcode VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd gymstatue2

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "이얍!"
	line "여기까지 왔단말인가!"
	cont "말해두겠지만 나는 강하단다!"

	para "단련시킨 포켓몬은"
	line "바위를 쪼개듯"
	cont "상대방의 뼈도 가루를 낸다!"

	para "잠시 보여주마"
	done

ChuckIntroText2:
	text "사도『우우-"
	line "…… …… ……"

	para "이야아앗!!"
	done

ChuckIntroText3:
	text "어때! 두려운 생각이 들었지?"

	para "뭐라 포켓몬이랑은 관계 없다?"
	line "그건 그렇다!"
	cont "그러나 승부를 낼 수 있을까!"
	done

ChuckLossText:
	text "오잉?"
	line "내가 지다니……"

	para "이런 일이!"
	line "좋아! 이 쇼크배지는"
	cont "너에게 어울린다!"
	done

GetStormBadgeText:
	text "<PLAYER>는(은) 사도로부터"
	line "쇼크배지를 받았다!"
	done

ChuckExplainBadgeText:
	text "쇼크배지가 있으면"
	line "다른 사람에게 얻은 포켓몬도"
	cont "레벨 70까지라면 말을 잘 듣는다"

	para "포켓몬의 기술로 하늘을 날다!"

	para "음 그리고 부록으로"
	line "이것을 가지고 가라!"
	done

ChuckExplainTMText:
	text "기술머신01의 내용물은"
	line "폭발 펀치!!"

	para "맞을까 어떨까 모르겠다만"
	line "맞으면 절대적으로"
	cont "곤란상태로 만들정도로"
	cont "일격을 강타시킨다!"
	done

ChuckAfterText:
	text "와하하!"
	line "난 즐거웠다!"

	para "하지만 패배는 패배이니까"
	line "내일부터 24시간 특훈강행이다!"
	done

BlackbeltYoshiSeenText:
	text "나랑 포켓몬은"
	line "뜨거운 우정으로 묶여 있다"
	cont "그 어누 누구도 깰 수 없지!"
	done

BlackbeltYoshiBeatenText:
	text "정말인가!?"
	done

BlackbeltYoshiAfterText:
	text "너랑 포켓몬도 제법"
	line "강하게 묶여있는 듯 하구나!"
	done

BlackbeltLaoSeenText:
	text "우리들 격투가에게"
	line "무서운 것은 없다!"
	done

BlackbeltLaoBeatenText:
	text "콰-쾅!"
	done

BlackbeltLaoAfterText:
	text "격투포켓몬은"
	line "초능력을 무서워하지"
	done

BlackbeltNobSeenText:
	text "맨몸으로 일관!"
	line "말은 필요 없다"
	cont "진정한 무사의 힘을 펼쳐라!"
	done

BlackbeltNobBeatenText:
	text "…… …… ……"
	done

BlackbeltNobAfterText:
	text "졌다면 말은 필요 없다!"
	done

BlackbeltLungSeenText:
	text "길이 빛날 무사도 정신으로 너의 "
	line "포켓몬을 가루로 만들어주마!"
	done

BlackbeltLungBeatenText:
	text "코 콩가루-다……"
	done

BlackbeltLungAfterText:
	text "자랑하는 포켓몬이 지다니"
	line "프라이드가 박살났구나……"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	db 9 ; object events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
