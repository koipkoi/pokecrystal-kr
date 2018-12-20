	const_def 2 ; object constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsPopText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisEeveeText:
	text "이수재『오오 <PLAYER>(이)냐"
	line "그래 부탁이 있어"
	cont "이브이를 맡아줘"

	para "이녀석 타임캡슐을"
	line "조정했더니"
	cont "갑자기 보내져왔단다"

	para "누군가 돌봐줘야 할텐데"
	line "나는 외출을 좋아해서 말야"
	cont "<PLAYER>(이)가 같이 잘 놀아줘"
	done

BillImCountingOnYouText:
	text "이수재『역시 "
	line "어이…… 바람둥이!"
	cont "얄밉도록 마음에 드는"
	cont "왕자님!"
	
	para "그럼 부탁해"
	line "많이 이뻐해줘!"
	done

ReceivedEeveeText:
	text "<PLAYER>는(은)"
	line "이브이를 얻었다!"
	done

BillEeveeMayEvolveText:
	text "이수재『이브이에게는 새로운"
	line "진화의 가능성이 있다고"
	cont "공박사님이 발표했단다"
	done

BillPartyFullText:
	text "으… 이런"
	line "그 이상 포켓몬을 지닐 수 없잖아"
	done

BillNoEeveeText:
	text "그러냐……"
	done

BillPopWontWorkText:
	text "이수재『나는 예전에"
	line "전송머신의 실험을 했었다"
	cont "그것의 연속이라도 시작해볼까"
	done

BillsPopText:
	text "너 포켓몬 모으고 있니"
	line "내 아들도"
	cont "포켓몬에 박식하단다"

	para "이수재라고 하는데"
	line "포켓몬 매니아란다"
	done

BillsMomText:
	text "무엇보다도 아들의 얼굴을 볼 수"
	line "있는 것은 엄마에게는 행복이지"
	done

BillsSisterUsefulNumberText:
	text "너 포켓몬 트레이너니?"

	para "그렇다면 내가 굉장한"
	line "전화번호를 가르쳐줄까?"
	done

RecordedBillsNumberText:
	text "<PLAYER>는(은) 이수재의"
	line "전화번호를 등록했다!"
	done

BillsSisterRefusedNumberText:
	text "컴퓨터로 포켓몬을 맡길 수 있는"
	line "시스템을 만든 것은"
	cont "내 오빠야"

	para "너에게 이수재 오빠의"
	line "전화번호를"
	cont "가르쳐주려고 생각했는데"
	done

BillsSisterPhoneFullText:
	text "앗!"
	line "그 이상 등록을 할 수 없구나"
	done

BillsSisterStorageSystemText:
	text "컴퓨터로 포켓몬을"
	line "맡길 수 있는 시스템을 만든 것은"
	cont "이수재 오빠란다"
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
