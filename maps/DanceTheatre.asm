	const_def 2 ; object constants
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_KIMONO_GIRL2
	const DANCETHEATRE_KIMONO_GIRL3
	const DANCETHEATRE_KIMONO_GIRL4
	const DANCETHEATRE_KIMONO_GIRL5
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY

DanceTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko2:
	trainer KIMONO_GIRL, NAOKO2, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaoko2SeenText, KimonoGirlNaoko2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaoko2AfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	buttonsound
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	jump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	buttonsound
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

KimonoGirlNaoko2SeenText:
	text "멋있는 포켓몬 데리고 왔군요"
	line "실력을 보여주시겠어요?"
	done

KimonoGirlNaoko2BeatenText:
	text "강하군요!"
	done

KimonoGirlNaoko2AfterBattleText:
	text "상대해주어서 즐거웠어요"
	line "또 부탁할께요"
	done

KimonoGirlSayoSeenText:
	text "항상 소중한 포켓몬과"
	line "함께 춤추고 있단다"
	cont "물론 포켓몬도 키우고 있지"
	done

KimonoGirlSayoBeatenText:
	text "아깝군요"
	line "조금만 더 했으면 이겼을텐데"
	done

KimonoGirlSayoAfterBattleText:
	text "춤도 포켓몬도"
	line "리듬이 중요해요"
	done

KimonoGirlZukiSeenText:
	text "내 꽃비녀 예쁘지?"
	line "응 포켓몬으로 승부하려고?"
	done

KimonoGirlZukiBeatenText:
	text "이젠 싸울 수 있는 포켓몬이"
	line "없게 되어버렸다"
	done

KimonoGirlZukiAfterBattleText:
	text "꽃비녀는 매월"
	line "정해진 꽃을 달아야 한단다"
	done

KimonoGirlKuniSeenText:
	text "와아 귀여운 트레이너"
	line "나랑 승부하려고요?"
	done

KimonoGirlKuniBeatenText:
	text "졌어요"
	line "보기보다 강하군요"
	done

KimonoGirlKuniAfterBattleText:
	text "많이 연습해서"
	line "실력을 갖춘 사람이 되었다고"
	cont "생각했는데 아직 멀었었군요"
	done

KimonoGirlMikiSeenText:
	text "어때 우리들의 춤은?"
	line "포켓몬도 실력이 뛰어나요"
	done

KimonoGirlMikiBeatenText:
	text "움"
	line "너도 포켓몬 실력이 좋구나"
	done

KimonoGirlMikiAfterBattleText:
	text "우리들의 춤을 보고"
	line "기뻐해주는 사람이 있고"
	cont "포켓몬도 곁에 있기때문에"
	cont "무엇이든 열심히 할 수 있어요"
	done

SurfGuyNeverLeftAScratchText:
	text "전통 무용수들은 춤뿐만 아니라"
	line "포켓몬에도 달인이다!"

	para "항상 도전하고 있지만"
	line "전혀 이길 수가 없구나……"
	done

SurfGuyLadGiftText:
	text "음!"
	line "전통 무용수들을 전부 이기면"
	cont "내가 좋은 물건을 주마!"
	done

SurfGuyLassieGiftText:
	text "Lassie, if you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done

SurfGuyLikeADanceText:
	text "거기에비해서"
	line "네 포켓몬의 싸움법은"
	cont "마치 춤을 추는 듯 했다!"

	para "좋은 구경을 했다!"

	para "이것은 내 마음의 선물이다"
	line "사양말고 받아주거라!"
	done

SurfGuySurfExplanationText:
	text "그것은 파도타기라고 해서"
	line "바다 위를"
	cont "슥슥 지나갈 수 있는 기술이란다!"
	done

SurfGuyElegantKimonoGirlsText:
	text "내 포켓몬도 그렇게"
	line "우아하게 되었으면 좋겠구나"
	done

RhydonText:
	text "코뿌리『쿠오오! 쿠오오오!"
	done

DanceTheatreCooltrainerMText:
	text "저 아저씨"
	line "항상 코뿌리랑 함께 있어!"

	para "파도타기를 쓸 수 있는 포켓몬에게"
	line "춤도 가르치고 싶다고 한다!"

	para "싱크로나이즈 스위밍이라도"
	line "시킬 작정인가"
	done

DanceTheatreGrannyText:
	text "전통 무용수들 이쁘구나……"

	para "그러나 사람들 앞에 나서는 것은"
	line "엄격한 관례랑 수행을"
	cont "소화하지 않으면 안 되지!"

	para "뭐 좋아한다면 뭐든지 할수 있지만"
	done

DanceTheatreFancyPanelText:
	text "비싼 것 같은 칸막이"
	line "계절별로 꽃이 그려져 있다!"
	done

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 9 ; object events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko2, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
