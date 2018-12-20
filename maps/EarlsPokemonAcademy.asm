	const_def 2 ; object constants
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "독@"
	db "마비@"
	db "잠듦@"
	db "화상@"
	db "얼음@"
	db "그만두다@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "다배워입니다!"
	line "포켓몬은 대단하지요!"

	para "나는 강해지기 위해"
	line "여러가지 가르쳐주지요"

	para "무엇이 알고싶은지?"
	line "어떡게 해야 강해질까"
	cont "알고싶은건가?"
	done

AcademyEarlTeachHowToWinText:
	text "그렇다면 내가"
	line "가르쳐주지요!"

	para "승부할 때"
	line "포켓몬 리스트의"
	cont "제일 위의 포켓몬이"
	cont "먼저 출전합니다"

	para "리스트의 순서를 바꾸면"
	line "승부에 유리하게 될지도 모르지!"

	para "그 밖에도 듣고싶은 것이 있는가?"
	done

AcademyEarlTeachMoreText:
	text "그럼- 포켓몬을"
	line "잘 키우는 방법을"
	cont "알고싶은가?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "그렇다면 내가"
	line "가르쳐주지요!"

	para "승부할 때"
	line "한번이라도 얼굴을 내민 포켓몬은"
	cont "경험치를 얻을 수 있습니다!"

	para "약한 포켓몬을"
	line "리스트의 위로 하고"
	cont "승부할 때에 바로 교대"

	para "이것으로 약한 포켓몬도"
	line "키울만하지요!"
	done

AcademyEarlNoMoreToTeachText:
	text "오- 그대는 우등생!"
	line "가르칠 것이 없을 것 같군요!"

	para "잡은 포켓몬이랑"
	line "사이좋게 지내시길!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "선생님의 말씀"
	line "공책에 써서 외운단다!"

	para "칠판에 써 있는 것도"
	line "공책에 옮겨놔야지……"
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "옆의 아이에게"
	line "내가 좋아하는 포켓몬을 보냈어!"
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "엥? 보내진 포켓몬"
	line "뭔가 가지고 있어!?"
	done

EarlsPokemonAcademyYoungster2Text:
	text "…포켓몬에게 나무열매를 지니게하면"
	line "자기 혼자서 체력을 회복한다"

	para "포켓몬이 지닐 수 있는 도구는"
	line "그 밖에도 많이 있다……"

	para "공책에 잘 적는 것은"
	line "힘들구나……"
	done

AcademyBlackboardText:
	text "칠판에"
	line "포켓몬이 싸우고 있을 때"
	cont "일어나는 몸의"
	cont "변화에 대해서 써져 있다"
	done

AcademyBlackboardText2:
; unused
	text "어느 항목을 보겠습니까?"
	done

AcademyPoisonText:
	text "독에 당하면"
	line "체력이 줄어갑니다"

	para "승부 뒤에도 독은 남아서"
	line "걸어다닐 때도 체력이 줄어듭니다"
	cont "해독제로 치료를 합시다"
	done

AcademyParalysisText:
	text "마비되면 스피드가 떨어지고"
	line "가끔 기술을 쓸 수 없게됩니다"

	para "싸움이 끝이나도"
	line "마비된채로 있게됩니다"
	cont "마비 치료제로 치료해줍시다"
	done

AcademySleepText:
	text "잠들어버리면"
	line "그동안에는 공격을 할 수 없습니다"

	para "승부가 끝나도"
	line "잠들어버린 채로 있습니다"
	cont "잠깨는 약으로 깨워줍시다"
	done

AcademyBurnText:
	text "화상은 체력이 줄어들고"
	line "공격력이 떨어집니다"

	para "승부가 끝났을 때에도"
	line "화상을 입은 채로 있습니다"
	cont "화상 치료제로 치료해줍시다"
	done

AcademyFreezeText:
	text "얼어버리면"
	line "아무것도 할 수 없게 됩니다"

	para "승부가 끝나도"
	line "얼어버린 채로 있습니다"
	cont "얼음상태 치료제로 몸을 녹여줍시다"
	done

AcademyNotebookText:
	text "이 아이의 공책이다……"

	para "포켓몬은"
	line "몬스터볼로 잡아서 동시에"
	cont "6마리를 데리고 다닐 수 있다"

	para "다음도 읽을까?"
	done

AcademyNotebookText1:
	text "몬스터볼을 던질 때에는"
	line "포켓몬의 기술로"
	cont "독이라든가 화상이라든가를 쓰면"
	cont "잡기 쉽다!"

	para "계속해서 읽을까?"
	done

AcademyNotebookText2:
	text "그 밖에도 포켓몬의 기술로"
	line "곤란해질 때가 있다"

	para "곤란해지면"
	line "가끔 틀려서"
	cont "자신을 공격해버린다"

	para "한번이라도 승부에서 발을 빼면"
	line "원래대로 돌아온다……"

	para "다음도 읽을까?"
	done

AcademyNotebookText3:
	text "그렇게해서 잡은 포켓몬을"
	line "키워서 싸움을 시키는 사람을"
	cont "포켓몬 트레이너라고 한다"

	para "트레이너의 목표는"
	line "각지의 포켓몬 체육관에 있는"
	cont "강한 트레이너를 이기는 것!"

	para "다음은……"
	line "글이 써있지 않다!"

	para "소년『에헤헤……"
	line "다음은 아무 것도 안 적었어……"
	done

AcademyStickerMachineText:
	text "여러가지 데이터를 스티커로"
	line "만들 수 있는 대단한 기계!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
