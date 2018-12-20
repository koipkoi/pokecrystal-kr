	const_def 2 ; object constants
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BUGSY, BUGSY1, MEM_BUFFER_1
	jumpstd gymstatue2

BugsyText_INeverLose:
	text "내이름은 호일!"
	line "벌레포켓몬에 대한 것은"
	cont "누구에게도 지지 않아!"
	
	para "누가 뭐라고 하든 장래희망은"
	line "벌레포켓몬 연구로"
	cont "훌륭한 박사님이 될꺼야!"
	
	para "그런 이유로 나의"
	line "연구 성과를 보여주겠어"
	done

BugsyText_ResearchIncomplete:
	text "우와 대단해!"
	line "너 포켓몬에대해 박식하구나!"
	
	para "아-아"
	line "내 연구는 아직 멀었어!"
	
	para "음! 알았다"
	line "이 배지를 가지고 가!"
	done

Text_ReceivedHiveBadge:
	text "<PLAYER>는(은) 호일로부터"
	line "인섹트배지를 받았다!"
	done

BugsyText_HiveBadgeSpeech:
	text "인섹트배지의"
	line "효과는 알고 있니?"
	
	para "인섹트배지를 달고 있으면"
	line "다른 사람에게 얻은 포켓몬도"
	cont "레벨 30까지의 포켓몬이"
	cont "결점 없이 잘 따르게된다!"
	
	para "또 풀베기를 배운"
	line "포켓몬은 싸우지 않을 때에도"
	cont "그 기술을 사용할 수 있단다!"
	
	para "그거랑 이것을 가지고 가!"
	done

BugsyText_FuryCutterSpeech:
	text "기술머신49의 내용물은"
	line "연속 자르기다!"
	
	para "공격이 빗나가지 않는다면"
	line "위력이 점점 높아진다!"
	
	para "싸움이 길어지는 만큼"
	line "유리해진단다"
	
	para "어때 대단하지!?"
	line "나의 발견이란다"
	done

BugsyText_BugMonsAreDeep:
	text "벌레포켓몬은 비밀이 깊단다"
	line "아직도 연구할 것이"
	cont "많이 있으니까"
	
	para "너도 좋아하는 포켓몬"
	line "철저하게 알아보면 어떻겠니?"
	done

BugCatcherBennySeenText:
	text "벌레포켓몬은 진화가 빠르다!"
	line "알겠냐? 그만큼"
	cont "빠르고 강해진다는 이야기다!"
	done

BugCatcherBennyBeatenText:
	text "진화만 시켜서는 안 되는 것인가"
	done

BugCatcherBennyAfterBattleText:
	text "포켓몬이 진화하면"
	line "파워업을 하는 것은 진짜야!"
	done

BugCatcherAlSeenText:
	text "멋있고 강한"
	line "벌레포켓몬의 매력을"
	cont "가르쳐주마!"
	done

BugCatcherAlBeatenText:
	text "너의 강함을 배웠어!"
	done

BugCatcherAlAfterBattleText:
	text "이렇게 멋있는데"
	line "벌레포켓몬을 싫어한다고 말하는"
	cont "여자애들이 꽤 있단다"
	cont "어째서인지 모르겠단말이야"
	done

BugCatcherJoshSeenText:
	text "야돈을 구해줬다고?"
	line "제법이군"
	
	para "하지만 내 포켓몬도"
	line "잘 자라고 있으니까 강하지!"
	done

BugCatcherJoshBeatenText:
	text "으으으……"
	done

BugCatcherJoshAfterBattleText:
	text "더욱 강한 기술을"
	line "가르치지 않으면 이기지 못할까"
	done

TwinsAmyandmay1SeenText:
	text "루비『오빠"
	line "관장님께 도전할꺼예요?"
	cont "그건 무리예요"
	done

TwinsAmyandmay1BeatenText:
	text "루비『오빠"
	line "관장님께 도전할꺼예요?"
	cont "그건 무리예요"
	done

TwinsAmyandmay1AfterBattleText:
	text "루비『오빠는 강하네요"
	done

TwinsAmyandmay2SeenText:
	text "루미『오빠"
	line "관장님께 도전할꺼예요?"
	cont "그럼 곧 겨루어보죠"
	done

TwinsAmyandmay2BeatenText:
	text "루비와루미『음냐 음냐네요"
	done

TwinsAmyandmay2AfterBattleText:
	text "루미『벌레포켓몬이 졌어요"
	line "분하네요"
	done

AzaleaGymGuyText:
	text "여어"
	line "도전자!"
	
	para "호일이는 아직 어리지만"
	line "벌레포켓몬에대한 지식이라면"
	cont "어른한테도 지지 않는다!"
	
	para "어드바이스가 없으면 힘들겠지?"
	line "좋-아 나한테 맡겨라!"
	
	para "그래!"
	line "벌레포켓몬은 화염을 싫어한다!"
	
	para "또 비행타입의 기술도"
	line "효과만점이란다!"
	done

AzaleaGymGuyWinText:
	text "잘 하잖아!"
	line "어린 트레이너끼리의"
	cont "맹렬한 배틀……"
	
	para "포켓몬 세계의"
	line "미래는 밝구나!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
