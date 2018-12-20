	const_def 2 ; object constants
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
	writetext UnknownText_0x55160
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext UnknownText_0x551b7
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x551ed
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x5514f
	writebyte FALSE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext UnknownText_0x5522c
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x5524f
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x55158
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x5514b
	opentext
	writetext UnknownText_0x5526a
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

MovementData_0x55146:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x5514b:
	step LEFT
	step DOWN
	step DOWN
	step_end

MovementData_0x5514f:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

MovementData_0x55158:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

UnknownText_0x55160:
	text "전철이 오지 않아!"

	para "이렇게되면 대신 내가"
	line "손님을 업고……"

	para "그건 무리인가"
	done

UnknownText_0x551b7:
	text "노랑시티행"
	line "이제 곧 출발합니다"
	cont "승차하시겠습니까?"
	done

UnknownText_0x551ed:
	text "승차권을 확인하겠습니다!"

	para "네!"
	line "이쪽으로 타십시오!"
	done

UnknownText_0x5522c:
	text "저 손님"
	line "승차권을 가지고 있지 않는군요"
	done

UnknownText_0x5524f:
	text "다음에도 이용을"
	line "부탁드리겠습니다!"
	done

UnknownText_0x5526a:
	text "대단히 고맙습니다"
	line "금빛시티에 도착했습니다"

	para "다음에도 이용을"
	line "부탁드리겠습니다!"
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "내가 사장이다!"

	para "포켓몬보다도 빠른 철도!"
	line "그것이 꿈이었단다!"

	para "이것으로 성도랑 관동지방이"
	line "더욱 가까워졌단다!"
	done

GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromSaffron

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
