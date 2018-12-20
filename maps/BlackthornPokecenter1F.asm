	const_def 2 ; object constants
	const BLACKTHORNPOKECENTER1F_NURSE
	const BLACKTHORNPOKECENTER1F_GENTLEMAN
	const BLACKTHORNPOKECENTER1F_TWIN
	const BLACKTHORNPOKECENTER1F_COOLTRAINER_M

BlackthornPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornPokecenter1FNurseScript:
	jumpstd pokecenternurse

BlackthornPokecenter1FGentlemanScript:
	jumptextfaceplayer BlackthornPokecenter1FGentlemanText

BlackthornPokecenter1FTwinScript:
	jumptextfaceplayer BlackthornPokecenter1FTwinText

BlackthornPokecenter1FCooltrainerMScript:
	jumpstd happinesschecknpc

BlackthornPokecenter1FGentlemanText:
	text "멀리 떨어진 석영고원"
	line "에 있는 포켓몬 리그"

	para "전국에서 실력이 있는"
	line "트레이너가 모여든다고 한다"
	done

BlackthornPokecenter1FTwinText:
	text "어떡게 하든 가르치고싶은"
	line "기술이 있어서"
	cont "망각의 아저씨에게 부탁해서"
	cont "비전기술을 잊게 시켰단다!"
	done

BlackthornPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, BLACKTHORN_CITY, 5
	warp_event  4,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FNurseScript, -1
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FTwinScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FCooltrainerMScript, -1
