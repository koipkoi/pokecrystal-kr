	const_def 2 ; object constants
	const COPYCATSHOUSE2F_COPYCAT1 ; if player is male
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL
	const COPYCATSHOUSE2F_COPYCAT2 ; if player is female

CopycatsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	disappear COPYCATSHOUSE2F_COPYCAT2
	appear COPYCATSHOUSE2F_COPYCAT1
	jump .Done
.Female:
	disappear COPYCATSHOUSE2F_COPYCAT1
	appear COPYCATSHOUSE2F_COPYCAT2
.Done:
	return

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	jump .Default_Merge_1

.Default_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Default_Merge_1:
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2a
	writetext CopycatText_Male_1
	jump .Default_Merge_2a

.Default_Female_2a:
	writetext CopycatText_Female_1
.Default_Merge_2a:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3a
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	jump .Default_Merge_3a

.Default_Female_3a:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3a:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2b
	writetext CopycatText_Male_2
	jump .Default_Merge_2b

.Default_Female_2b:
	writetext CopycatText_Female_2
.Default_Merge_2b:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3b
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	jump .Default_Merge_3b

.Default_Female_3b:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3b:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	buttonsound
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	jump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	buttonsound
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	jump .GotPass_Merge_1

.GotPass_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.GotPass_Merge_1:
	special LoadUsedSpritesGFX
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_2
	writetext CopycatText_Male_3
	jump .GotPass_Merge_2

.GotPass_Female_2:
	writetext CopycatText_Female_3
.GotPass_Merge_2:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_3
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	jump .GotPass_Merge_3

.GotPass_Female_3:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.GotPass_Merge_3:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	buttonsound
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd picturebookshelf

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>『야아! 안녕!"
	line "너 포켓몬 좋아하니?"

	para "<PLAYER>『내가 아니고"
	line "너에게 물어보고 있는건데"

	para "<PLAYER>『…… 얼라리 뭐야!"
	line "이상한 녀석이구나!"
	done

CopycatText_QuickMimicking:
	text "흉내내기 아가씨『…… 뭐?"
	line "사람들 흉내를 내지 말라고?"

	para "하지만 나는"
	line "흉내내기가 취미야!"
	done

CopycatText_Male_2:
	text "<PLAYER>『야아! 안녕!"
	line "삐삐인형을 잃어버리고"
	cont "낙심하고 있는 것 같구나!"

	para "<PLAYER>『찾아주면"
	line "정기권을 받을 수 있니?"

	para "<PLAYER>『그럼 내가"
	line "찾아줄께!"

	para "갈색시티에 갔을 때"
	line "떨어뜨렸는지도 몰라!"
	done

CopycatText_Worried:
	text "흉내내기 아가씨『…… 뭐?"
	line "맘대로 정하지말라구?"

	para "그치만 곤란하니까……"
	line "누군가 주워갔을까……?"
	done

CopycatText_GiveDoll:
	text "흉내내기 아가씨『와아-!"
	line "내 삐삐인형!"
	cont "여기 오른쪽 다리의 상처"
	cont "이게 증거야!"
	done

CopycatText_GivePass:
	text "약속대로 자 이거!"
	line "리니어 기차의 정기권이야!"
	done

CopycatText_ExplainPass:
	text "흉내내기 아가씨『리니어 기차에"
	line "탈 때 사용하는 정기권이야!"

	para "전에 살고있던 집이"
	line "리니어 기차역이 되었을 때"
	cont "철도회사 사람이"
	cont "준 것이야!"
	done

CopycatText_Male_3:
	text "<PLAYER>『야아! 아까는"
	line "리니어 기차 정기권 고마웠어!"

	para "<PLAYER>『…… 뭐-야?"

	para "<PLAYER>『내 흉내를 내면"
	line "그렇게 즐겁니?"
	done

CopycatText_ItsAScream:
	text "흉내내기 아가씨『응……!"
	line "무척 재미있어!"
	done

CopycatText_Female_1:
	text "<PLAYER>: Hi. You"
	line "must like #MON."

	para "<PLAYER>: No, not"
	line "me. I asked you."

	para "<PLAYER>: Pardon?"
	line "You're weird!"
	done

CopycatText_Female_2:
	text "<PLAYER>: Hi. Did"
	line "you really lose"
	cont "your # DOLL?"

	para "<PLAYER>: You'll"
	line "really give me a"

	para "rail PASS if I"
	line "find it for you?"

	para "<PLAYER>: Sure,"
	line "I'll look for it!"

	para "You think you lost"
	line "it when you were"
	cont "in VERMILION?"
	done

CopycatText_Female_3:
	text "<PLAYER>: Thank you"
	line "for the rail PASS!"

	para "<PLAYER>: …Pardon?"

	para "<PLAYER>: Is it"
	line "really that fun to"

	para "copy what I say"
	line "and do?"
	done

CopycatsDodrioText1:
	text "두트리오『두- 트리오!"
	done

CopycatsDodrioText2:
	text "…… 거울아 거울아!"
	line "세계에서 제일 예쁜"
	cont "여자아이는 누구?"
	done

CopycatsHouse2FDollText:
	text "이것은 희귀한 포켓몬!?"
	line "…… 얼라리? 인형이였군"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	db 6 ; object events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_2
