	const_def 2 ; object constants
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	return

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	buttonsound
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	itemtotext TM_DRAGONBREATH, MEM_BUFFER_0
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	buttonsound
	jump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CLAIR, CLAIR1, MEM_BUFFER_1
	jumpstd gymstatue2

ClairIntroText:
	text "내가 이향!"
	line "세계에서 제일가는"
	cont "드래곤 조련사다"

	para "실력도 역시 포켓몬 리그의"
	line "사천왕들에게도"
	cont "진적이 없다!"
	cont "어때 그래도 싸울꺼니?"

	para "…… 그래 알겠다"
	line "그럼 시작해보자꾸나!"

	para "나역시 체육관 관장으로서"
	cont "전력을 다해서 상대를 해준다!"
	done

ClairWinText:
	text "이 내가 지다니……"

	para "믿을 수 없어"
	line "뭔가 잘못된 것 같아……"
	done

ClairText_GoToDragonsDen:
	text "わたしは　みとめないわ"

	para "まけて　いうのも　なんだけど"
	line "あなたの　かんがえかた　じゃ"
	cont "#り-グに　ちょうせん　なんて"
	cont "むり　よ"

	para "……　そうだわ!"

	para "この　#ジムの　うらに"
	line "りゅうのあな　とよばれる"
	cont "ばしょが　あるの"

	para "ちゅうおうに　ほこらが　あるから"
	line "そこへ　いきなさい"

	para "もし　そこで　あなたが"
	line "あまい　かんがえを　かえられたなら"

	para "ジムバッジを　わたすに　ふさわしい"
	line ""
	cont "として　みとめてあげるわ!"
	done

ClairText_TooMuchToExpect:
	text "어떻게 되었니?"

	para "역시 너에게는 무리였나?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "おそいわよ!"
	line "さっさと　うけとりなさい!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER>는(은) 이향으로부터"
	line "기술머신24를 얻었다!"
	done

BlackthornGymClairText_DescribeTM24:
	text "안에 들어 있는 것은"
	line "용의 숨결"
	
	para "…… 그다지 화려하진 않아"
	line "필요 없으면 무리해서"
	cont "가지고 가지 않아도 좋아"
	done

BlackthornGymClairText_BagFull:
	text "なによ!"
	line "せいり　されてないじゃないの!"
	done

BlackthornGymClairText_League:
	text "どうしたの?"
	line "#り-グに　むかうんでしょう?"

	para "ばしょは　しってるの?"

	para "ここからだと　そうね…"
	line "まずは　ワカバタウンに　いくといいわ"

	para "そこから　なみのりで"
	line "ずっと　ひがしに　すすんで　いけば"
	cont "#り-グに　とうちゃく　するわ"
	cont "でも　きびしい　みちのりに　なるわよ"

	para "それと…　#り-グでも"
	line "まけることは　ゆるさないからね!"

	para "そうでないと　まけた　わたしが　"
	line "みじめに　なるでしょ!"

	para "…がんばりなさい"
	done

CooltrainermPaulSeenText:
	text "처음 싸우는 드래곤 조련사의"
	line "강함을 알아두는 것이 좋을꺼다!"
	done

CooltrainermPaulBeatenText:
	text "ボクの　ドラゴンが　まけるなんて!"
	done

CooltrainermPaulAfterBattleText:
	text "えっ!　ワタルさまに"
	line "また　あおうって　いわれたのかい?"
	cont "まさか…　そんな　はず　ないよ!"
	done

CooltrainermMikeSeenText:
	text "내가 질꺼라는 예상 같은 것은"
	line "1퍼센트도 없어!"
	done

CooltrainermMikeBeatenText:
	text "이상하네"
	done

CooltrainermMikeAfterBattleText:
	text "나의 부족함을 깨닫게되었다"
	line "그것을 가르쳐준"
	cont "너에게 감사한다!"
	done

CooltrainerfLolaSeenText:
	text "드래곤은 성스러운 생명체"
	line "생명력이 넘치는 포켓몬"
	cont "전력을 다하지않으면 이길수 없다!"
	done

CooltrainerfLolaBeatenText:
	text "제법 하는군"
	done

CooltrainerfLolaAfterBattleText:
	text "그렇군 드래곤의 약점은"
	line "드래곤타입의 기술이지"
	done

BlackthornGymGuyText:
	text "여어!"
	line "미래의 챔피언!"

	para "드디어 이곳까지 왔구나"
	line "이제 얼마 남지 않았다!"
	cont "나도 협력하겠어!"

	para "이향이가 사용하는 포켓몬은"
	line "전설의 생명체"
	cont "성스러운 드래곤 포켓몬"

	para "시시한 공격으로는"
	line "데미지를 입힐 수 없지!"

	para "…… 하지만"
	line "얼음타입의 기술에는"
	cont "약하다는 이야기가 있어!"
	done

BlackthornGymGuyWinText:
	text "이향에게 이기다니"
	line "대단하군!"

	para "남은 것은 포켓몬 리그의 도전!"
	line "목표로 삼아라 챔피언을!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
