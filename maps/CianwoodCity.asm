	const_def 2 ; object constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	return

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	buttonsound
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	buttonsound
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	buttonsound
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript:
; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "저 바다를 건너왔니?"
	line "그것 힘들었겠구나"

	para "포켓몬이 하늘을 나는 기술을"
	line "알고 있으면 편해질텐데……"
	done

ChucksWifeBeatChuckText:
	text "체육관 배지가 없으면 쓸 수 없어"
	line "너 이 마을의 체육관 관장에게"
	cont "이기면 다시 오너라"
	cont "좋은 선물을 줄테니까"
	done

ChucksWifeGiveHMText:
	text "그것은 진청시티의 체육관 배지!"

	para "그럼 이 비전머신을"
	line "가지고가도 좋아"
	done

ChucksWifeFlySpeechText:
	text "공중날기를 가르치면"
	line "지금까지 갔던 장소에"
	cont "일순간에 갈 수 있도록 된단다"
	done

ChucksWifeChubbyText:
	text "호호호 우리집 남편이라면"
	line "너에게 지고나서부터 특훈을 한단다"

	para "요즘은 운동이 되어서 아주 좋아"
	line "배가 나와서말야"
	done

CianwoodCityYoungsterText:
	text "공중날기 기술을 쓰게되면"
	line "담청시티에도 바로 갈 수 있겠네!"
	done

CianwoodCityPokefanMText:
	text "마을 북쪽에 있는 바위를 부수면"
	line "여러가지 것들이 튀어 나온단다 "

	para "바위를 부수고싶다면"
	line "포켓몬에게 바위깨기를"
	cont "시키면 좋을꺼야"
	done

CianwoodCityLassText:
	text "체육관 관장인 사도님은"
	line "격투포켓몬을 단련시키는데"
	cont "자신이 직접 상대를 해준단다"
	done

CianwoodCityUnusedText:
; unused
	text "여기랑 담청시티의 사이에"
	line "몇 개의 섬이 있었지"

	para "섬 안에는 바다의 신이"
	line "살고 있다는 이야기가 있어"
	done

EusineSuicuneText:
	text "EUSINE: Yo,"
	line "<PLAYER>."

	para "Wasn't that"
	line "SUICUNE just now?"

	para "I only caught a"
	line "quick glimpse, but"

	para "I thought I saw"
	line "SUICUNE running on"
	cont "the waves."

	para "SUICUNE is beau-"
	line "tiful and grand."

	para "And it races"
	line "through towns and"

	para "roads at simply"
	line "awesome speeds."

	para "It's wonderful…"

	para "I want to see"
	line "SUICUNE up close…"

	para "I've decided."

	para "I'll battle you as"
	line "a trainer to earn"
	cont "SUICUNE's respect!"

	para "Come on, <PLAYER>."
	line "Let's battle now!"
	done

EusineBeatenText:
	text "I hate to admit"
	line "it, but you win."
	done

EusineAfterText:
	text "You're amazing,"
	line "<PLAYER>!"

	para "No wonder #MON"
	line "gravitate to you."

	para "I get it now."

	para "I'm going to keep"
	line "searching for"
	cont "SUICUNE."

	para "I'm sure we'll see"
	line "each other again."

	para "See you around!"
	done

CianwoodCitySignText:
	text "이곳은 진청시티"
	line "거친 물결에 둘러싸인 바다마을"
	done

CianwoodGymSignText:
	text "진청시티 포켓몬 체육관"
	line "관장 사도"
	cont "훌륭한 무사의 길을 펼친 사나이"
	done

CianwoodPharmacySignText:
	text "창업 500년 전통의"
	line "진청시티 약국"
	cont "약에대한 상담 기다리고 있겠습니다"
	done

CianwoodPhotoStudioSignText:
	text "진청시티 사진 아저씨"
	line "여행의 기념으로 1장 찍으세요!"
	done

CianwoodPokeSeerSignText:
	text "THE # SEER"
	line "AHEAD"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	db 1 ; coord events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	db 8 ; bg events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	db 12 ; object events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
