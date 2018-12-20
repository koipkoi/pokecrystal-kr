	const_def 2 ; object constants
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd radio2

EcruteakItemfinderAdventureText:
	text "호오! 포켓몬과 함께"
	line "탐험의 여행을 하고 있느냐"

	para "탐험이라고 하면 보물찾기!"
	line "그렇게 생각하지?"
	done

EcruteakItemfinderTrueSpiritText:
	text "오오!"
	line "사나이의 로망을 알고 있구나"

	para "마음에 들었다!"
	line "이것을 가지고 가거라!"
	done

ItemfinderExplanationText:
	text "보이지 않아도 여기저기"
	line "도구가 떨어져 있다"

	para "다우징머신을 사용하면"
	line "너의 근처에"
	cont "도구가 떨어져 있을까 없을까"
	cont "조사할 수 있다"

	para "단지 어디에 떨어져 있는가는"
	line "알 수 없으니까 직접 찾아보거라"

	para "그래!"
	line "인주시티의 불탄 탑에도"
	cont "보물이 있다고 하는 소문이 있다"
	done

EcruteakItemfinderToEachHisOwnText:
	text "…… 그런가"
	line "뭐 사람따라 각각 다르지"
	done

EcruteakHistoryBookText:
	text "인주시티의 역사……"

	para "읽어보겠습니까?"
	done

EcruteakTwoTowersText:
	text "인주시티에는 2개의 탑이 있어"
	line "각각 포켓몬이"
	cont "머무는 장소였다"

	para "그러나 탑이 불에 탄 이후"
	line "포켓몬을 볼 수 없게 되었다……"
	cont "그렇게 전해지고 있습니다"

	para "계속해서 읽어보시겠습니까?"
	done

EcruteakThreeMonText:
	text "또한 인주시티에는"
	line "마을 근처를 이리저리 뛰어다니는"
	cont "포켓몬들이 있었습니다"

	para "각각"
	line "번개 화염 물의"
	cont "정령이라 전해지고 있습니다"

	para "그러나 자신들의"
	line "너무나도 강한 힘을 주체 못하고"
	cont "여기저기 풀숲을"
	cont "바람처럼 가르고 달리고 있었다……"
	cont "그렇게 전해지고 있습니다"
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
