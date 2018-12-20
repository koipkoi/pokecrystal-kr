	const_def 2 ; object constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	priorityjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	jump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	buttonsound
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	writebyte TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	writebyte TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	jump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CYNDAQUIL, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem TOTODILE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	jump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	writebyte HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	buttonsound
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	buttonsound
	writetext ElmAfterTheftText5
	buttonsound
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	buttonsound
	writetext ShowElmTogepiText3
	buttonsound
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	buttonsound
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	jump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "공박사『앗 <PLAY_G>"
	line "기다리고 있었단다!"

	para "오늘 너를 부른 것은"
	line "부탁이 있어서란다!"

	para "지금 포켓몬에 대해"
	line "새로운 연구를"
	cont "하고 있는데"

	para "<PLAY_G>도 협력을"
	line "해주었으면 하구나!"

	para "사실은…"

	para "학회에 발표할"
	line "자료를 작성하고 있는데"
	cont "모르는 것이 있단다…"

	para "그래서!"

	para "내가 최근에 잡은"
	line "포켓몬을 길러주었으면 하구나"
	done

ElmText_Accepted:
	text "<PLAY_G> 고맙구나!"
	line "엄청 도움이 될거야!"
	done

ElmText_Refused:
	text "그런 말 말고!"
	line "부탁이다!"
	done

ElmText_ResearchAmbitions:
	text "이"
	line "연구를 발표하면"

	para "다시 포켓몬의 비밀에 조금"
	line "더 근접할 것이 틀림없다!"

	para "기대되는구나!"
	done

ElmText_GotAnEmail:
	text "아! 메일이다!"

	para "………………………………………………"
	line "흠흠"

	para "오- 그렇군"
	done

ElmText_MissionFromMrPokemon:
	text "내가 아는 사람중에"
	line "포켓몬 할아버지라고 하는"

	para "이상한것을 발견했을 때"
	line "대발견! 이라고 떠드는"
	cont "할아버지가 있단다"

	para "그리고 전에"
	line "「이번만큼은 진짜야!」"
	cont "라는 메일이 왔단다"

	para "호기심이 생기지만"
	line "나도 조수도 포켓몬"
	cont "연구로 바쁘거든……"
	cont "아!"
	
	para "그래!"

	para "<PLAY_G> 부탁한다!"
	line "대신 가주거라!"
	done

ElmText_ChooseAPokemon:
	text "내가 길러주길 바라는 포켓몬이"
	line "이 볼에 들어있단다!"

	para "<PLAY_G>이 처음으로"
	line "파트너가 될 포켓몬이다"

	para "자 고르거라!"
	done

ElmText_LetYourMonBattleIt:
	text "포켓몬을 가지고 있다면"
	line "야생의 포켓몬이 나와도"
	cont "싸우게하면 될꺼란다!"
	done

LabWhereGoingText:
	text "공박사『잠깐 잠깐"
	line "어디에 가느냐!"
	done

TakeCyndaquilText:
	text "공박사『불꽃의 포켓몬"
	line "브케인으로 하겠니!?"
	done

TakeTotodileText:
	text "공박사『물포켓몬"
	line "리아코가 마음에 드느냐!?"
	done

TakeChikoritaText:
	text "공박사『풀포켓몬"
	line "치코리타가 마음에 들었느냐!?"
	done

DidntChooseStarterText:
	text "공박사『차분히 생각해서"
	line "정하는 것이 좋을꺼다"
	cont "소중한 파트너가 될테니까"
	done

ChoseStarterText:
	text "공박사『나도 이녀석은"
	line "최고의 포켓몬이라고 생각한다!"
	done

ReceivedStarterText:
	text "<PLAYER>는(은)"

	line "@"
	text_ram wStringBuffer3
	text "를(을) 받았다"
	done

ElmDirectionsText1:
	text "포켓몬 할아버지가 계신 곳은"
	line "이 마을 근처의"
	cont "무궁시티 끝이란다"

	para "거기까지는 거의"
	line "외길이니까 찾기 쉬울꺼다"

	para "참 내 전화번호를"
	line "알려줄테니까"
	cont "무슨 일이 있으면 연락하거라!"
	done

ElmDirectionsText2:
	text "포켓몬이 상처를 입었다면"
	line "저쪽에 있는 기계로"
	cont "포켓몬을 회복시켜주거라"

	para "언제든지 써도 된단다"
	line ""
	done

ElmDirectionsText3:
	text "그럼"
	line "<PLAY_G> 부탁하네!"
	done

GotElmsNumberText:
	text "<PLAYER>는(은) 공박사님의"
	line "전화번호를 등록했다"
	done

ElmDescribesMrPokemonText:
	text "포켓몬 할아버지는"
	line "여러 장소에 가서"
	cont "희귀한 것을 발견한단다"

	para "희귀한 것만으로는"
	line "도움이 되지 않을테지만……"
	done

ElmPokeBallText:
	text "공박사가 발견한"
	line "포켓몬이 들어있다!"
	done

ElmsLabHealingMachineText1:
	text "무슨 기계일까?"
	done

ElmsLabHealingMachineText2:
	text "포켓몬을 회복시키겠습니까?"
	done

ElmAfterTheftText1:
	text "공박사『<PLAY_G>……"
	line "큰 일이 났었단다"

	para "아 그래 그래"
	line "포켓몬 할아버지의"
	cont "대발견이란 것은 무엇이었느냐?"
	done

ElmAfterTheftText2:
	text "<PLAYER>는(은) 공박사에게"
	line "이상한 알을 전해주었다!"
	done

ElmAfterTheftText3:
	text "공박사『이것은……"
	done

ElmAfterTheftText4:
	text "…… 혹시"
	line "포켓몬의 알!?"

	para "만약 그렇다면 정말로"
	line "엄청난 대발견이구나!"
	done

ElmAfterTheftText5:
	text "공박사『응? 오박사님께"
	line "포켓몬 도감을 받았다고!?"

	para "<PLAY_G> 저 정말이니?"
	line "그 그것은 정말 굉장하구나!"

	para "누가 뭐라든 오박사님은"
	line "트레이너의 재능을 꿰뚫어보는"
	cont "힘을 가지고 계시니까"

	para "그래 <PLAY_G> 너에게는"
	line "챔피언이 될 수 있는"
	cont "소질이 있을지도 모르겠구나"

	para "포켓몬도 잘 따르는 것 같고"
	line "이대로 각지의 포켓몬 체육관에"
	cont "도전 해보면 어떻겠느냐?"

	para "여기서부터라면 도라지시티의"
	line "포켓몬 체육관이 제일 가깝단다"
	done

ElmAfterTheftText6:
	text "…… <PLAY_G>"
	line "챔피언을 목표로 하는 것은"
	cont "길고 긴 여행이 될꺼라 생각한다"

	para "출발하기 전에"
	line "어머님께 잘 말씀드리거라"
	done

ElmStudyingEggText:
	text "공박사『힘내거라!"
	line "나도 알에대해서 알게되면"
	cont "연락을 하겠다"
	done

ElmAideHasEggText:
	text "공박사『엥 <PLAY_G>"
	line "내 조수랑 만나지 못 했느냐?"

	para "너에게 알을 전해주기위해"
	line "도라지시티의 포켓몬센터에"
	cont "갔을텐데……"

	para "길이 어긋났나보구나"
	line "미안하지만 조수에게 가보거라"
	done

ElmWaitingEggHatchText:
	text "공박사『어떤가"
	line "알에 변화는 있었느냐?"
	done

ElmThoughtEggHatchedText:
	text "응 <PLAY_G>"
	line "알이 부화했지 않느냐"
	cont "포켓몬 어떻게하고 있느냐?"
	done

ShowElmTogepiText1:
	text "공박사『<PLAY_G>"
	line "건강해 보이는구나"
	done

ShowElmTogepiText2:
	text "엥?"
	line "그 포켓몬은……!"
	done

ShowElmTogepiText3:
	text "알이 부화했구나!"

	para "그렇다면 포켓몬은"
	line "알에서 태어나는 것인가……"

	para "아냐아냐 모든 포켓몬이"
	line "그렇게 정해진 것은 아닐꺼다"

	para "우-음 아직도"
	line "조사할 것이 많이 있구나"
	done

ElmGiveEverstoneText1:
	text "<PLAY_G> 고맙구나!"
	line "너의 덕분으로 포켓몬의"
	cont "비밀을 알 수 있을 것 같구나"

	para "이것은 나의 답례란다"
	line "사양말고 가지고 가거라!"
	done

ElmGiveEverstoneText2:
	text "그것은 변함없는 돌!"

	para "포켓몬은 종류에 따라서"
	line "어느정도 키우면"
	cont "진화해서 모습이 바뀐단다"

	para "그때 변함없는 돌을"
	line "가지고 있게하면 진화하지 않는단다"

	para "지금의 모습 그대로 키우고 싶은"
	line "포켓몬이 있다면 사용 해보거라"
	done

ElmText_CallYou:
	text "공박사『그럼 <PLAY_G>"
	line "뭔가 알아내면 연락하겠다"
	done

AideText_AfterTheft:
	text "…… 휴우"
	line "…… 빼앗긴 포켓몬"
	cont "지금쯤 뭘 하고 있을까……"

	para "나쁜 사람에게 키워지면"
	line "나쁜 포켓몬이 된다고 말하니까"
	done

ElmGiveMasterBallText1:
	text "공박사『여어 <PLAY_G>!"
	line "네 덕분으로"
	cont "연구도 척척 진행되고 있단다"

	para "이것은 나의 답례품"
	line "꼭 사용하거라!"
	done

ElmGiveMasterBallText2:
	text "이 마스터볼은!!"

	para "어떤 포켓몬이라도"
	line "절대적으로 잡을 수 있는"
	cont "궁극의 몬스터볼"

	para "포켓몬의 연구를"
	line "인정받는 사람에게"
	cont "보내지는 것 같은데……"

	para "나보다는 네가"
	line "잘 사용할 수 있다고 생각한단다"
	cont "<PLAY_G>에게 주겠다!"
	done

ElmGiveTicketText1:
	text "공박사『야아 <PLAY_G>"
	line "기다리고 있었단다!"

	para "오늘 너를 부른 것은"
	line "주고싶은 것이 있기때문이란다"

	para "이것!"
	line "승선 티켓"

	para "이것으로 관동지방의 포켓몬도"
	line "잡을 수 있게 되었구나!"
	done

ElmGiveTicketText2:
	text "쾌속선에 탄다고 하면"
	line "담청시티란다!"

	para "……곤 하지만 <PLAY_G>이"
	line " 더 잘 아는 것 같구나"

	para "포켓몬과 함께"
	line "여러 곳을 여행했으니까"

	para "그럼 관동지방에 가면"
	line "오박사님께 부탁한다!"
	done

ElmsLabSignpostText_Egg:
	text "박사님이 연구하고 있는"
	line "포켓몬의 알이다!"
	done

AideText_GiveYouPotion:
	text "<PLAY_G>!"
	line "심부름을 해 주는 그대에게"
	cont "이것을 줄께요!"
	done

AideText_AlwaysBusy:
	text "둘밖에 없으니까"
	line "약간의 일로도 당황스럽다……"

	para "아- 바빠요"
	done

AideText_TheftTestimony:
	text "밖에서 커다란 소리가 나서……"

	para "박사님이랑 보러 나갔다가"
	line "포켓몬을 도둑맞은 것 같습니다……"

	para "다른 사람의 물건을 훔치다니"
	line "믿을 수가 없어요!"

	para "…… 휴우"
	line "…… 도둑맞은 포켓몬"
	cont "지금쯤 어떻게 되었을까……"

	para "나쁜사람에게 키워지면"
	line "나쁜 포켓몬이 된다니까"
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "포켓몬 도감을 만드는 그대에게"
	line "이것을 전해주겠습니다!"
	done

AideText_ExplainBalls:
	text "포켓몬 도감을 만들 때에는"
	line "포켓몬을 잡아야합니다!"

	para "몬스터볼을"
	line "야생의 포켓몬에게 던지면"
	cont "잡을 수 있습니다!"
	done

ElmsLabOfficerText1:
	text "이 연구소"
	line "포켓몬을 도둑맞은 것 같아서……"

	para "지금 공박사님으로부터"
	line "말씀을 듣고있던 중입니다"
	cont "뭐든지 빨갛고 긴"
	cont "머리카락의 소년이었던 것 같아서"

	para "엣!"
	line "그런 트레이너랑 싸웠다고?"

	para "이름이라던가"
	line "말하지 않았던가요?"
	done

ElmsLabOfficerText2:
	text "알겠습니다!"
	line "<RIVAL>(이)라고 하는군요!"

	para "협력해주셔서"
	line "고맙습니다!"
	done

ElmsLabWindowText1:
	text "창문이 열려 있다"
	line "바람이 기분좋게 불어온다!"
	done

ElmsLabWindowText2:
	text "이곳으로 들어왔구나!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER>는(은) 책을 꺼냈다"

	para "탐험지식 제1"

	para "스타트 버튼을 누른다!"
	line "메뉴가 펼쳐진다!"
	done

ElmsLabTravelTip2Text:
	text "<PLAYER>는(은) 책을 꺼냈다"

	para "탐험지식 제2"

	para "포켓몬 레포트로"
	line "기록을 할 수 있다!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER>는(은) 책을 꺼냈다"

	para "탐험지식 제3"

	para "가방을 열어서"
	line "셀렉트 버튼을 누른다!"
	cont "도구를 교체할 수 있다!"
	done

ElmsLabTravelTip4Text:
	text "<PLAYER>는(은) 책을 꺼냈다"

	para "탐험지식 제4"

	para "포켓몬의 사용 기술을 보고"
	line "A버튼을 누른다!"
	cont "기술을 교체할 수 있다!"
	done

ElmsLabTrashcanText:
	text "공박사님이 드셨던"
	line "과자봉지가 모두 있다……"
	done

ElmsLabPCText:
	text "포켓몬 진화의"
	line "관찰결과"

	para "…화면에 그렇게 써져있어…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 8 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
