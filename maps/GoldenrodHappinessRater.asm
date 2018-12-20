	const_def 2 ; object constants
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

HappinessRatersHouseRadio:
	jumpstd radio2

GoldenrodHappinessRaterTeacherText:
	text "포켓몬도 말이야"
	line "소중히 대해주면 잘 따른단다"

	para "응?"
	line "너의 @"
	text_ram wStringBuffer3
	text "……"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "매우 행복해 보이는군"
	line "틀림없이 아주 많이"
	cont "너를 잘 따르고 있는 것 같구나!"
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "너를 믿을 수 있겠다"
	line "그런 기분이 들어"
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "너를 잘 따르고 있구나"
	line "어쩐지 행복해 보이는구나"
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "제법 귀엽네"
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "조금 더 귀여워 해주면 어때?"
	line "아직 너에게 익숙해지지 않았나봐"
	done

GoldenrodHappinessRatingText_LooksMean:
	text "전혀 따르지 않는 것 같구나"
	line "어쩐지 눈빛이 안 좋아"
	done

GoldenrodHappinessRaterPokefanMText:
	text "언제나 포켓몬 승부에 져서"
	line "기절만 시키고……"

	para "그것이 이유일까"
	line "포켓몬이 잘 따라주질 않아"
	done

GoldenrodHappinessRaterTwinText:
	text "포켓몬에게 도구를 사용해주면"
	line "매우 기뻐하게 된단다!"
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
