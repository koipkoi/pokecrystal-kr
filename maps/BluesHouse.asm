	const_def 2 ; object constants
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkcode VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "남나리『내 남동생"
	line "상록시티 체육관의 관장이란다"

	para "종일 체육관을 비우고"
	line "모두를 곤란하게 만드는 것 같아"
	done

DaisyOfferGroomingText:
	text "남나리『어서와"
	line "마침 잘 되었어!"
	cont "지금부터 녹차를 마실 시간이란다"

	para "응? 너의 포켓몬"
	line "엄청 더러워진 것 같구나!"
	cont "내가 깨끗하게 해줄까"
	done

DaisyWhichMonText:
	text "남나리『어느 포켓몬으로 할래?"
	done

DaisyAlrightText:
	text "남나리『그럼"
	line "깨끗하게 해줄게!"
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text "는(은)"
	line "매우 기분이 좋아보인다!"
	done

DaisyAllDoneText:
	text "남나리『자!"
	line "엄청 깨끗해졌단다!"

	para "우후후"
	line "귀여운 포켓몬이네!"
	done

DaisyAlreadyGroomedText:
	text "남나리『이 시간은"
	line "매일 녹차를 마시고 있으니까"
	cont "또 와!"
	done

DaisyRefusedText:
	text "남나리『깨끗해지기 싫어?"
	line "그럼 차나 마시렴"
	done

DaisyCantGroomEggText:
	text "남나리『우후후!"
	line "알은 광이나 내렴"
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
