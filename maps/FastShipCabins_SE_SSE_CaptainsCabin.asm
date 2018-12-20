	const_def 2 ; object constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, MovementData_0x76004
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInQuickly
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, MovementData_0x7600c
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	jump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, MovementData_0x76010
	opentext
	writetext SSAquaEntertainedGranddaughterText
	buttonsound
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	jump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "이야- 살았어!"

	para "저 여자아이"
	line "놀이상대하기엔 지쳐서"
	cont "곤란해하고 있던 중이란다"
	done

SSAquaCaptainHowDoYouLikeText:
	text "우리 아쿠아호에"
	line "탄 기분은 어떤가!?"
	cont "바다 위를 미끄러지듯"

	para "달리고 있지!"
	done

SSAquaCantFindGranddaughterText:
	text "어이 꼬마야……"
	line "손녀가 보이질 않는단다……"

	para "배의 어딘가에 있다면"
	line "그렇게 걱정은 아니지만"
	cont "활발한 여자아이라서"
	cont "누군가에게 실례를 범하고 있을지도"
	cont "그렇게 생각하니까 걱정이다……"
	done

SSAquaEntertainedGranddaughterText:
	text "그러니까 <PLAY_G>이었던가"
	line "손녀랑 놀아주었다지"
	cont "고맙구나!"
	cont "내게도 보답의 기회를 주련?"
	done

SSAquaGrandpaHaveThisText:
	text "그래! 만약 너만 좋다면"
	line "이것을 가지고 가주겠니!"
	done

SSAquaGrandpaTravellingText:
	text "우리들은 세계 방방곡곡을"
	line "여행하며 돌고 있단다"
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "선장님"
	line "나랑 놀자!"

	para "시시해!"
	line "더 놀고싶어!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "오빠"
	line "나랑 놀래?"
	cont "……엣!"
	cont "할아버지가 걱정하고 있어?"
	cont "그럼 나 돌아갈께!"
	cont "할아버지가 있는 곳에 돌아갈래!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "할아버지 다녀왔습니다!"
	line "선장님이랑"
	cont "오빠랑"
	cont "놀았어요!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "할아버지 다녀왔습니다!"
	line "선장님이랑"
	cont "언니랑"
	cont "놀았어요!"
	done

SSAquaGranddaughterHadFunText:
	text "모두랑 놀아서"
	line "굉장히 재미있었다!"
	done

PokefanmColinSeenText:
	text "아저씨랑 승부하자!"
	done

PokefanmColinBeatenText:
	text "강하군!"
	done

PokefanmColinAfterBattleText:
	text "너 혼자니?"
	line "어머니가 걱정하고 있지 않니?"
	done

TwinsMegandpeg1SeenText:
	text "꼬맹이라고 생각하고 있습니까?"
	line "그런 일은 없을테니까"
	done

TwinsMegandpeg1BeatenText:
	text "이런 졌잖아!"
	done

TwinsMegandpeg1AfterBattleText:
	text "꼬맹이라고 부르는 것은"
	line "아이들에게 실례되니까!"
	done

TwinsMegandpeg2SeenText:
	text "우리들은 꼬맹이가 아니예요"
	line "그런건 숙녀에게 실례예요"
	done

TwinsMegandpeg2BeatenText:
	text "아 졌당!"
	done

TwinsMegandpeg2AfterBattleText:
	text "절대 어린아이쪽이"
	line "영리한 때가 있다구!"
	done

PsychicRodneySeenText:
	text "움! 내 두뇌가"
	line "전파를 잡았다!"
	done

PsychicRodneyBeatenText:
	text "……무엇인가 들린다!"
	done

PsychicRodneyAfterBattleText:
	text "그래 쾌속선의 안에는"
	line "성도의 라디오를 들을 수 있다!"
	done

PokefanmJeremySeenText:
	text "어때 우리 포켓몬"
	line "매우 예쁘지?"
	done

PokefanmJeremyBeatenText:
	text "아아……!"
	line "겨우 예쁘게 했었는데!"
	done

PokefanmJeremyAfterBattleText:
	text "포켓몬 미용실에서"
	line "또 예쁘게 다듬어야지!"
	done

PokefanfGeorgiaSeenText:
	text "백화점에서 쇼핑을!"
	line "그리고나서……"
	done

PokefanfGeorgiaBeatenText:
	text "뭐였지……?"
	done

PokefanfGeorgiaAfterBattleText:
	text "그래 그래 보모에게 맡겼던"
	line "포켓몬을 찾으러 가야해!"
	done

SupernerdShawnSeenText:
	text "너 몬스터볼을"
	line "몇 종류 가지고 있니?"
	done

SupernerdShawnBeatenText:
	text "이봐 잠깐"
	line "너 그만둬!"
	done

SupernerdShawnAfterBattleText:
	text "볼은 상황에따라"
	line "사용방법의 나누는 편이 좋아!"
	done

SSAquaHasArrivedVermilionText:
	text "쾌속선 아쿠아호는"
	line "갈색항에 도착했습니다!"
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 11 ; object events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
