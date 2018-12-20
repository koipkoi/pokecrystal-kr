	const_def 2 ; object constants
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER

CeruleanCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "관동의 발전소?"

	para "발전소는 9번 도로의"
	line "끝에 있단다"

	para "사고가 났다는 것 같지만"
	done

CeruleanCityCooltrainerMText2:
	text "호오오!"
	line "모든 포켓몬을 모으고 있어?"

	para "아주 힘들겠지만"
	line "보람도 있는 일이겠지"
	done

CeruleanCitySuperNerdText:
	text "북쪽에 있는 호수공원은"
	line "여자들에게 인기 있는"
	cont "데이트 장소란다!"
	done

CeruleanCitySlowbroText:
	text "야돈『야-아?"
	done

CeruleanCityCooltrainerFText1:
	text "나랑 야도란의 콤비"
	line "끝내준다구!"
	done

CeruleanCityCooltrainerFText2:
	text "자 야도란"
	line "염동력을 발휘해라!"
	done

CeruleanCityCooltrainerFText3:
	text "…… …… …… ……"
	line " …… …… …… ……"
	done

CeruleanCityFisherText:
	text "블루시티 체육관의 이슬이"
	line "저 팬이예요!"
	done

CeruleanCityFisherRocketTipText:
	text "무척이나 수상한 사람이"
	line "블루시티의 호수공원에 있었다!"
	done

CeruleanCityYoungsterText1:
	text "엄청 강한 포켓몬이 있는"
	line "동굴이 있데!"
	done

CeruleanCityYoungsterText2:
	text "엥……?"

	para "내 다우징 머신이"
	line "반응을 하고 있어……?"
	done

CeruleanCitySignText:
	text "이곳은 블루시티"
	line "블루는 바닷빛 신비의 색깔"
	done

CeruleanGymSignText:
	text "블루시티 포켓몬 체육관"
	line "관장 이슬"
	cont "말괄량이 인어"
	done

CeruleanBikeShopSignText:
	text "……전단지가 붙어 있다!"

	para "……미라클 사이클은"
	line "성도의 금빛시티로"
	cont "이사했습니다……"
	done

CeruleanPoliceSignText:
	text "……전단지가 붙어 있다!"

	para "도둑질은 하지맙시다"
	line "모두 함께 사이좋게 밝은 마을"
	cont "…… 블루시티 경찰 알림"
	done

CeruleanCapeSignText:
	text "이 앞은 블루시티의 호수공원"
	done

CeruleanLockedDoorText:
	text "…… 열쇠가 잠겨져 있다!"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	db 6 ; object events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
