CeladonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER>는(은)"
	line "컴퓨터의 스위치를 켰다!"

	para "…… …… ……"

	para "전자 메일을 쓰고 있는"
	line "도중인 것 같다!"

	para "…… …… ……"

	para "오랜만에 관동에"
	line "와주세요"

	para "꽤 변모해 있어서"
	line "놀랄꺼라 생각해요!"

	para "성도에서는 모습을 보이지 않는"
	line "포켓몬도 많이 있어요"

	para "……감독님께"

	para "…… …… ……"
	done

CeladonMansion2FMeetingRoomSignText:
	text "게임 프리크 본관"
	line "응접실"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	db 0 ; object events
