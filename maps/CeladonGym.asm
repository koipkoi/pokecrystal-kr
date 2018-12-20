	const_def 2 ; object constants
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	buttonsound
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext ERIKA, ERIKA1, MEM_BUFFER_1
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "민화『하아-이……"
	line "좋은 날씨로군요"
	cont "……자기도 모르게 꾸벅꾸벅"
	cont "잠들어버릴 것 같네요……"

	para "나는 무지개시티 체육관의"
	line "민화라고 합니다"

	para "…… ……아아!"
	line "성도로부터 멀리서도"

	para "…… 엣"
	line "시합을 하시려구요?"

	para "저런……"
	line "난 지지 않아요"
	done

ErikaBeatenText:
	text "민화『……!"
	line "졌습니다"

	para "아주 강하군요……"

	para "이 무지개배지를"
	line "드리겠습니다"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER>는(은)"
	line "무지개배지를 얻었다!"
	done

ErikaExplainTMText:
	text "민화『멋있는 시합이었어요"
	line "저는 아주 감동했어요"
	cont "이 기술머신을 드리겠습니다"

	para "기가 드레인이라고 하는"
	line "받은 데미지의 반이"
	cont "포켓몬의 영양이 되는"
	cont "대단한 기술입니다"

	para "괜찮다면"
	line "사용해보세요"
	done

ErikaAfterBattleText:
	text "민화『진다고 하는 것은"
	line "분한 것이군요……"

	para "그러나 강한 분이 계시다는"
	line "것은 격려가 되기도 하는군요"
	done

LassMichelleSeenText:
	text "이곳은말야!"
	line "여자아이 전용 체육관이야!"
	done

LassMichelleBeatenText:
	text "아앙 분해!"
	done

LassMichelleAfterBattleText:
	text "여자아이끼리만 할수있는"
	line "이야기가 있잖아!"
	done

PicnickerTanyaSeenText:
	text "에엣 포켓몬 승부를 할꺼니?"
	line "가끔씩 하고 있긴한데 한번 해볼까"
	done

PicnickerTanyaBeatenText:
	text "엣 이건 꿈일꺼야"
	done

PicnickerTanyaAfterBattleText:
	text "엣 그렇게많이 배지를 가지고"
	line "있다면 이길 수 없지"
	done

BeautyJuliaSeenText:
	text "엥? 꽃이랑 나"
	line "어느쪽을 정신없이 보고있니?"
	done

BeautyJuliaBeatenText:
	text "에에엥!"
	done

BeautyJuliaAfterBattleText:
	text "어떡게해야 민화님 같이"
	line "품위있게 될 수 있을까?"
	done

TwinsJoAndZoe1SeenText:
	text "민화 언니를 습격했던"
	line "포켓몬의 기술을 보여줘!"
	done

TwinsJoAndZoe1BeatenText:
	text "졌어요……"
	done

TwinsJoAndZoe1AfterBattleText:
	text "민화 언니가"
	line "복수를 할꺼예요!"
	done

TwinsJoAndZoe2SeenText:
	text "민화 언니는"
	line "우리들이 지킬꺼예요!"
	done

TwinsJoAndZoe2BeatenText:
	text "이기지 못했어요……"
	done

TwinsJoAndZoe2AfterBattleText:
	text "민화 언니는"
	line "더 강해요!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	db 6 ; object events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
