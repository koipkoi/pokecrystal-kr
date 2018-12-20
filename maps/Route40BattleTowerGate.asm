	const_def 2 ; object constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

UnknownText_0x9f66f:
	text "キミも　バトルタワ-　みにきたの?"
	line "でも　まだ　はいれない　みたいだね…"
	done

UnknownText_0x9f6ba:
	text "バトルタワ-が　オ-プンしたから"
	line "はやく　いきたいんだけどさ"

	para "かったときに　どんな"
	line "かっこいい　セりフで　キメるか"
	cont "きまらなくて　まよってるんだ"
	done

Route40BattleTowerGateRockerText:
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done

UnknownText_0x9f783:
	text "バトルタワ-で　あそべるように"
	line "なった　ときの　ために"
	cont "#　きたえに　いってこよっと!"
	done

Route40BattleTowerGateTwinText:
	text "ぜったいに　つかいたい"
	line "#のレべルが　バラバラだから"
	cont "いまから　きたえなおしに　いくの!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
