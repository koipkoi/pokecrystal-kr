	const_def 2 ; object constants
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd pokecenternurse

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "너는 포켓몬 비전이라고 불리는"
	line "기술을 알고 있을까"
	
	para "포켓몬은 빈사상태라든지"
	line "싸울 힘이 없을때만"
	cont "비전은 사용할 수 있다고 한다"
	done

AzaleaPokecenter1FUnusedText:
; unreferenced
	text "포켓몬을 컴퓨터에"
	line "맡기는 시스템을"
	cont "이수재라는 녀석이 만들었대"

	text "이수재의 컴퓨터를 사용하면"
	line "1개의 박스에 20마리까지"
	cont "포켓몬을 맡길 수 있어"
	done

AzaleaPokecenter1FFishingGuruText:
	text "이수재의 컴퓨터를 사용하면"
	line "1개의 박스에 20마리까지"
	cont "포켓몬을 맡길 수 있다!"
	done

AzaleaPokecenter1FPokefanFText:
	text "너 규토리라는 것 알고 있니?"
	
	para "규토리의 열매를 쪼개서"
	line "내용물을 제거하면"
	cont "특수한 장치를 만들어낸단다"
	
	para "그럼 포켓몬을 잡는 것을"
	line "할 수 있도록 된단다!"
	
	para "몬스터볼이 팔릴 때까지"
	line "모두 규토리를 사용해서"
	cont "포켓몬을 잡았단다"
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
