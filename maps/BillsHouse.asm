	const_def 2 ; object constants
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlitheVulpix
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LICKITUNG, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	jump .ShowedStaryu

.GotWaterStone:
	checkver
	iftrue .AskVulpix
	writetext BillsGrandpaGrowlitheText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump .ShowedGrowlitheVulpix

.AskVulpix:
	writetext BillsGrandpaVulpixText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal VULPIX, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump .ShowedGrowlitheVulpix

.GotFireStone:
	writetext BillsGrandpaPichuText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	jump .ShowedPichu

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedOddish:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedGrowlitheVulpix:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedPichu:
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsGrandpaIntroText:
	text "응? 너"
	line "이수재에대해 알고있느냐?"
	cont "이수재는 내 손자란다!"

	para "성도에서 컴퓨터…… 뭔가의"
	line "일을 하고있어서"
	cont "내가 집을 지키고 있단다!"
	done

BillsGrandpaAskToSeeMonText:
	text "그 포켓몬을 가지고 있다면"
	line "꼭 보여줬으면 좋겠는데……"
	done

BillsGrandpaExcitedToSeeText:
	text "오오 보여주려구!"
	line "고맙구나!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "가지고있지 않느냐?"
	line "그거 유감이구나……"
	done

BillsGrandpaShownPokemonText:
	text "그것이 "
	line "@"
	text_ram wStringBuffer3
	text "인가!"
	line "귀여운 포켓몬이로구나!"

	para "좋은 것 구경 잘 했다"
	done

BillsGrandpaTokenOfAppreciationText:
	text "고맙구나!"

	para "답례로 이것을 주마!"
	done

BillsGrandpaComeAgainText:
	text "또 놀러오너라"
	done

BillsGrandpaShownAllThePokemonText:
	text "귀여운 포켓몬을"
	line "많이 구경 잘 했다"
	cont "고맙구나!"

	para "매우 즐거웠단다!"
	line "이야아 역시 오래살고 볼 일이야!"
	done

BillsGrandpaWrongPokemonText:
	text "우-움……"

	para "소문으로 들은 포켓몬은"
	line "그렇게 생기지 않은 것 같은데……"
	done

BillsGrandpaLickitungText:
	text "손자 이수재가 말했던"
	line "길다란 혀로 낼름! 하고"
	cont "핥는 포켓몬이 있다는 것 같은데"
	done

BillsGrandpaOddishText:
	text "그래그래 손자에게 들었는데"
	line "둥글고 녹색에다가"
	cont "머리에 잎사귀가 나있는"
	cont "포켓몬이 있다고 하던데"
	done

BillsGrandpaStaryuText:
	text "몸에 빨간 구슬이 있는"
	line "바다의 포켓몬이 있지?"
	cont "별 모양을 하고있는 녀석"

	para "밤이되면 나타난다고 하던데"
	line "내가 꼭 보고싶단다!"
	done

BillsGrandpaGrowlitheText:
	text "주인 트레이너에게 충직하고"
	line "짖는 특기가 있는 포켓몬이"
	cont "있다고 이수재에게 들었단다"
	done

BillsGrandpaVulpixText:
	text "6개의 꼬리를 가진"
	line "귀여운 포켓몬이 있다는데"

	para "나도 한번 그 포켓몬을"
	line "안아보고 싶구나"
	done

BillsGrandpaPichuText:
	text "인기 최고의 포켓몬이"
	line "있다는데!"

	para "이렇게! 노란색 몸에"
	line "빨간 볼을 한 포켓몬이지"

	para "그것이 진화하기 전의 모습을"
	line "한번 보고싶단다!"
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
