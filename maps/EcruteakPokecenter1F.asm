	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	priorityjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	buttonsound
	jump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "나는 이수재"
	line "너는……?"

	para "후움 <PLAYER>(이)라고 하는가"
	line "좋을때 왔구나"
	done

EcruteakPokecenter1F_BillText2:
	text "지금 타임캡슐의"
	line "조정이 끝났단다"

	para "너도 알고있는 그대로"
	line "포켓몬을 교환할 수 있잖아"

	para "그래서 옛날의 사람들과도"
	line "교환할 수 있도록"
	cont "타임캡슐이 만들어졌단다"

	para "…… 하지만"
	line "옛날 사람들이 모르는 것은"
	cont "보낼 수 없단다"
	cont "컴퓨터가 파손될 위험이 있어서"

	para "그렇기때문에 이쪽에서 옛날에"
	line "없었던 것을 빼지 않으면 안 되"

	para "확실히 이야기 한다면"
	line "새로운 포켓몬"
	cont "새로운 기술은"
	cont "타임캡슐에서는"
	cont "통신교환을 할 수 없어"

	para "뭐 그 부분은 조정 했고"
	line "내일이 되면"
	cont "전국의 포켓몬 센터에서"
	cont "타임캡슐을 쓸 수 있을꺼야"

	para "그럼 나는 금빛시티에 돌아갈께"
	line "가끔은 부모님이랑도 지내야지"

	para "그럼 바이바이!"
	done

EcruteakPokecenter1FPokefanMText:
	text "전통 무용수는 춤도"
	line "포켓몬을 사용하는 모습도 아름다워"
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "체육관 관장인 유빈님"
	line "멋있어"
	cont "그 냉정한 점이 좋아"

	para "게다가 포켓몬도"
	line "매우 강하니까"
	done

EcruteakPokecenter1FGymGuyText:
	text "분노의 호수……"
	line "갸라도스의 대량발생……"
	cont "무언가 사건의 냄새가 난다"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
