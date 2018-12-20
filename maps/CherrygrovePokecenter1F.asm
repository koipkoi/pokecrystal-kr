	const_def 2 ; object constants
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_FISHER
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER

CherrygrovePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd pokecenternurse

CherrygrovePokecenter1FFisherScript:
	jumptextfaceplayer CherrygrovePokecenter1FFisherText

CherrygrovePokecenter1FGentlemanScript:
	jumptextfaceplayer CherrygrovePokecenter1FGentlemanText

CherrygrovePokecenter1FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CommCenterOpen
	writetext CherrygrovePokecenter1FTeacherText
	waitbutton
	closetext
	end

.CommCenterOpen:
	writetext CherrygrovePokecenter1FTeacherText_CommCenterOpen
	waitbutton
	closetext
	end

CherrygrovePokecenter1FFisherText:
	text "포켓몬을 몇 마리든 맡겨도 "
	line "공짜인 것은 기분좋지"
	done

CherrygrovePokecenter1FGentlemanText:
	text "저쪽에 놓여 있는 컴퓨터는"
	line "포켓몬 트레이너라면 누구든지"
	cont "자유롭게 사용해도 좋단다!"
	done

CherrygrovePokecenter1FTeacherText:
	text "2층의 통신센터는"
	line "마침내 최근에 생겼단다"

	para "하지만 아직"
	line "조정중이라더군"
	done

CherrygrovePokecenter1FTeacherText_CommCenterOpen:
	text "2층의 통신센터는"
	line "마침내 최근에 생겼단다"

	para "나는 바로"
	line "포켓몬 교환을 했단다!"
	done

CherrygrovePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CHERRYGROVE_CITY, 2
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FFisherScript, -1
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTeacherScript, -1
