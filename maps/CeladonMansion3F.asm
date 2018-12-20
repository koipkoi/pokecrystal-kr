	const_def 2 ; object constants
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUY
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	checkcode VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	buttonsound
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	buttonsound
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting:
; unused
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "그렇습니까-!"

	para "나는 게임 디자이너"

	para "포켓몬 도감을 전부 모으는 것은"
	line "무척 힘들겠지만 용기를 내!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "와아 대단해!"
	line "이제 조금 있으면 포켓몬 도감에"
	cont "페이지전부를 써넣을 수 있을꺼야!"

	para "축하해!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…… ……"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "그래픽 디자이너가"
	line "표창장을"
	cont "프린트해서 줄꺼야!"
	cont "모두에게 보여주거라!"
	done

GameFreakGraphicArtistText:
	text "나는 그래픽 디자이너!"
	line "너를 그린 것은 나란다!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "나는 그래픽 디자이너!"

	para "오옷 도감을 완성했구나!"
	line "기념으로 표창장을"
	cont "프린트해서 줄까?"
	done

GameFreakGraphicArtistRefusedText:
	text "프린트를 하고싶어지면"
	line "이야기를 하거라!"
	done

GameFreakGraphicArtistErrorText:
	text "어쩐지 상태가 좀 안 좋군"
	line "프린트는 중지하겠다!"
	done

GameFreakProgrammerText:
	text "나?"
	line "프로그래머다! 슬롯머신 하자!"
	done

GameFreakCharacterDesignerText:
	text "쌍둥이 귀엽지!"

	para "규리씨도 크-!"

	para "참지 못 하겠어!"
	done

CeladonMansion3FDevRoomSignText:
	text "게임 프리크 개발실"
	done

CeladonMansion3FDrawingText:
	text "아름다운 그림이 그려져 있다"
	line "……매력적인 여자아이다!"
	done

CeladonMansion3FGameProgramText:
	text "게임 프로그램이다!"
	line "이거 바꾸면 버그가 날지도!"
	done

CeladonMansion3FReferenceMaterialText:
	text "여러가지 자료들이 가득"
	line "……삐삐인형이다!"
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	db 4 ; object events
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
