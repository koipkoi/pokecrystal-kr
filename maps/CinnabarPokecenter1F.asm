	const_def 2 ; object constants
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_COOLTRAINER_F
	const CINNABARPOKECENTER1F_FISHER

CinnabarPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CinnabarPokecenter1FNurseScript:
	jumpstd pokecenternurse

CinnabarPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CinnabarPokecenter1FCooltrainerFText

CinnabarPokecenter1FFisherScript:
	jumptextfaceplayer CinnabarPokecenter1FFisherText

CinnabarPokecenter1FCooltrainerFText:
	text "홍련마을 체육관의 강연님"
	line "쌍둥이섬의 동굴에"
	cont "혼자서 있다고 한다……"
	done

CinnabarPokecenter1FFisherText:
	text "이곳의 화산이 분화한 것은"
	line "1년전이었단다"
	done

CinnabarPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CINNABAR_ISLAND, 1
	warp_event  4,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FCooltrainerFScript, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FFisherScript, -1
