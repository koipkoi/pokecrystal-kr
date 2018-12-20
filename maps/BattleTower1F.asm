	const_def 2 ; object constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	writebyte BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .priorityjump1
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	priorityjump Script_ResumeBattleTowerChallenge
	end

.priorityjump1
	priorityjump BattleTower_LeftWithoutSaving
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
	writebyte BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	jump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	writebyte TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	jump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	writebyte BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writebyte BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	jump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	writebyte BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	writebyte BATTLETOWERACTION_1C
	special BattleTowerAction
	writebyte BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	itemtotext USE_SCRIPT_VAR, MEM_BUFFER_1
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	jump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6:
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea:
	writebyte BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	writebyte BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writebyte BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	jump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	writebyte BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	jump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:	
	text "배틀타워에 잘 오셨습니다!"
	line ""

	para "이곳에서는 배틀 룸으로"
	line "안내를 드리고 있습니다"
	done

Text_WantToGoIntoABattleRoom:	
	text "배틀 룸에 도전하시겠습니까?"
	done

Text_RightThisWayToYourBattleRoom:	
	text "그럼 배틀 룸으로"
	line "안내해드리겠습니다"
	done

Text_BattleTowerIntroduction_1:	
	text "배틀타워는 포켓몬 배틀을"
	line "하기 위한 시설입니다"

	para "전국에서 수많은　포켓몬"
	line ""
	cont "들이 모여"

	para "배틀 룸이라고 하는 대전용으로"
	line "준비된 방에서 대전합니다"

	para "배틀 룸은 배틀타워 안에"
	line "많이 준비되어있습니다"

	para "배틀 룸에는 각각"
	line "7명씩 "
	cont "가 있어서"

	para "그 7명을 모두 쓰러뜨리고"
	line "그 성적이 좋을 경우 그 방의"
	cont "리더가 될 수 있습니다"

	para "리더가 된 사람은 역대의"
	line "리더로서 이름이 남겨집니다"

	para "도전은 하루 5번까지"
	line "그리고 1개의 방에는 하루"
	cont "1번만 도전할 수 있습니다"

	para "또한 도중에 그만두고 싶을 때에는"
	line "리포트를 제대로 작성해두지 않으면"
	cont "이어서 도전할 수가 없으므로"
	cont "조심해주십시오"

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "배틀타워는 포켓몬 배틀을"
	line "하기 위한 시설입니다"

	para "전국에서 수많은　포켓몬"
	line ""
	cont "들이 모여"

	para "배틀 룸이라고 하는 대전용으로"
	line "준비된 방에서 대전합니다"

	para "배틀 룸은 배틀타워 안에"
	line "많이 준비되어있습니다"

	para "배틀 룸에는 각각"
	line "7명씩 "
	cont "가 있어서"

	para "모두 쓰러뜨리게 되면"
	line "상을 받게 됩니다"

	para "또한 도중에 그만두고 싶을 때에는"
	line "리포트를 제대로 작성해두지 않으면"
	cont "이어서 도전할 수가 없으므로"
	cont "조심해주십시오"

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:	
	text "역대 리더들의 목록이"
	line "보내져왔습니다"

	para ""
	done

Text_PleaseConfirmOnThisMonitor:	
	text "이쪽의 모니터 화면으로"
	line "확인하여주십시오"
	done

Text_ThankYou:	
	text "수고하셨습니다!"

	para ""
	done

Text_ThanksForVisiting:
	text "다음 이용을 기다리겠습니다!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "축하드립니다!"
	line "리더를 이기셨군요!"

	para "<PLAYER> 님은 리더를"
	line "이기셨으므로 성적을"

	para "등록하면 배틀 룸의"
	line "리더가 되실 지도 모릅니다!"

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "축하드립니다!"

	para "모든 트레이너를 쓰러뜨렸군요!"

	para "그 대가로 엄청난"
	line "상품을 드리겠습니다!"

	para ""
	done

Text_AskRegisterRecord_Mobile:	
	text "이번 성적을 센터에"
	line "등록하시겠습니까?"
	done

Text_PlayerGotFive:
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer4
	text "를(을) 5개 받았다!@"
	sound_item
	text_waitbutton
	db "@"

Text_YourPackIsStuffedFull:
	text "어라 가방이"
	line "가득 찼네요"

	para "공간을 만들고"
	line "다시 와주십시오"
	done

Text_YourRegistrationIsComplete:
	text "등록이"
	line "완료되었습니다"

	para "다음에 또 오세요!"
	done

Text_WeHopeToServeYouAgain:	
	text "그럼 다음 이용을"
	line "기다리겠습니다"
	done

Text_PleaseStepThisWay:	
	text "이쪽으로 오시죠"
	done

Text_WouldYouLikeToHearAboutTheBattleTower:	
	text "배틀타워의 설명을"
	line "들으시겠습니까?"
	done

Text_CantBeRegistered:	
	text "이전의 방에서의 도전은"
	line "성적을 센터에 등록할 수"
	cont "없습니다만 괜찮겠습니까?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:	
	text "이전의 방에서의 도전은"
	line "성적을 센터에 등록할 수"
	cont "없습니다"

	para "또한 지금 있는 성적도"
	line "지워집니다만 괜찮겠습니까?"
	done

Text_CheckTheLeaderHonorRoll:	
	text "역대 리더의 목록입니다"
	line "보겠습니까?"
	done

Text_ReadBattleTowerRules:
	text "배틀 타워의 규칙이 적혀있다"
	line "읽어 보겠습니까?"
	done

Text_BattleTowerRules:
	text "3마리 포켓몬이"
	line "배틀에 참가합니다"

	para "3마리 모두"
	line "다른 포켓몬이어야 합니다"

	para "지닌물건도 모두 다른 종류로"
	line "지니고 있어야 합니다"

	para "특정 포켓몬에게는"
	line "레벨 제한이 있을 수 있습니다"
	done

Text_BattleTower_LeftWithoutSaving:	
	text "손님!"

	para "지난번에 리포트를 작성하지 않고"
	line "종료하셨죠?"

	para "죄송합니다만 이런 경우에는"
	line "도전이 무효가 됩니다"
	done

Text_YourMonWillBeHealedToFullHealth:	
	text "포켓몬의 체력을"
	line "회복해드리겠습니다"
	done

Text_NextUpOpponentNo:	
	text "다음은 @"
	text_ram wStringBuffer3
	text "번째 상대입니다"
	line "준비되셨습니까?"
	done

Text_SaveBeforeConnecting_Mobile:	
	text "센터에 연결하기 전에"
	line "리포트를 작성하겠습니다"
	done

Text_SaveBeforeEnteringBattleRoom:
	text "배틀 룸에 들어가기 전에"
	line "리포트를 작성하겠습니다"
	done

Text_SaveAndEndTheSession:	
	text "리포트를 작성하고"
	line "종료하시겠습니까?"
	done

Text_SaveBeforeReentry:	
	text "이전 방에 도전하기 전에"
	line "리포트를 작성하겠습니다"
	done

Text_CancelYourBattleRoomChallenge:	
	text "배틀 룸 도전을"
	line "중지하시겠습니까?"
	done

Text_RegisterRecordOnFile_Mobile:	
	text "손님의 지난번"
	line "성적이 남아있습니다만"

	para "성적을 센터에"
	line "등록하겠습니까?"
	done

Text_WeveBeenWaitingForYou:	
	text "기다리셨습니다 그럼"
	line "배틀룸에 안내해드리겠습니다"
	done

Text_FiveDayBattleLimit_Mobile:	
	text "배틀 룸에 대한 도전은"
	next "하루 5번까지입니다!"

	para "다음날 이후에 찾아와주십시오"
	done

Text_TooMuchTimeElapsedNoRegister:	
	text "죄송합니다! 손님이"
	line "지금 도전한 성적은"

	para "도전을 시작하고 나서"
	line "시간이 많이 흘러"
	cont "센터에 등록할 수 없습니다!"
	done

; a dupe?	
Text_RegisterRecordTimedOut_Mobile:	
	text "죄송합니다! 손님이"
	line "지난번에 도전한 성적은"

	para "도전을 시작하고 나서"
	line "시간이 많이 흘러"
	cont "센터에 등록할 수 없습니다!"
	done

Text_AMonLevelExceeds:	
	text "손님의 포켓몬 중에"
	line "레벨 @"
	deciram wScriptVar, 1, 3
	text "를(을) 넘은"
	cont "포켓몬이 있습니다"
	done

Text_MayNotEnterABattleRoomUnderL70:	
	text_ram wcd49
	text "는(은) 레벨 70 이상의"
	line "배틀 룸에만 참가할 수 있습니다"
	cont "이 방은 레벨 @"
	deciram wScriptVar, 1, 3
	text "입니다"
	done

Text_BattleTowerYoungster:	
	text "첫번째로 만난 상대에게"
	line "순식간에 져버렸어…"
	cont "안되겠어 난…"
	done

Text_BattleTowerCooltrainerF:	
	text "배틀 룸은 많이 있지만"
	line "밑바닥부터 올라가겠어!"
	done

Text_BattleTowerGranny:	
	text "배틀 중에 도구를"
	line "사용할 수 없다는 건"
	cont "힘들구먼…"
	
	para "어떤 도구를 지니게 하는지가"
	line "승부를 판가름하겠구먼"
	done

Text_BattleTowerBugCatcher:	
	text "나는 벌레 포켓몬만으로"
	line "어디까지 갈 수 있나 해보겠어!"

	para "…불꽃 포켓몬 나오지 말길!"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	db 5 ; object events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
