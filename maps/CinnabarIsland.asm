	const_def 2 ; object constants
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd pokecentersign

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "누구냐 너는?"
	line "포켓몬 트레이너라는 것은"
	cont "보면 바로 알 수 있지만……"

	para "나의 이름은 그린!"
	line "챔피언을 지냈던 사나이지!"
	cont "뭐 짧은 기간동안이었지만……"
	cont "레드녀석에게"
	cont "방해를 받아서말이지……!"

	para "그건 그렇고 너 무슨 용무냐?"
	line "나와 싸우고싶은 것이냐"

	para "…… 내가 지금"
	line "싸우고싶은 기분이 아니란다"

	para "보아라 이 상태를……"

	para "화산이 잠시 분화를 했다고"
	line "마을 하나가 사라져버렸다"

	para "포켓몬 승부로"
	line "이겼다 졌다라고 말해도"
	cont "자연의 흔들림 한가지로"
	cont "우리들은 지고만단다……"

	para "…… …… ……"
	line "…… …… ……"
	cont "뭐 좋아"
	cont "나는 트레이너이니까"
	cont "강한 녀석이 있다면"
	cont "싸우고 싶어지니까"

	para "너 나랑 싸우고싶으면"
	line "상록시티로 오너라"
	cont "그 때 상대를 해주마"
	done

CinnabarIslandGymSignText:
	text "……벽보가 붙어 있다!"

	para "홍련마을의 체육관은"
	line "쌍둥이 섬으로 옮겼습니다"
	cont "…… 강연"
	done

CinnabarIslandSignText:
	text "이곳은 홍련마을"
	line "홍련은 빨강과 정열의 색깔"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	db 1 ; object events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
