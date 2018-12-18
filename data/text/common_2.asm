UnknownText_0x1c0000::
	text "뭐야……그만둘텐가"
	line "다음에 또 오너라"
	done

UnknownText_0x1c0021::
	text "알을"
	line "촬영한다고 해도…………"
	done

UnknownText_0x1c0043::
	text "예 예!"
	line "나는 이름풀이 점술가"
	cont "말하자면 이름으로 점을 칩니다"

	para "네, 당신 포켓몬의"
	line "별명으로 점을 봐 줄께요"
	done

UnknownText_0x1c00a0::
	text "어느 포켓몬의"
	line "별명을 점 칠텐가?"
	prompt

UnknownText_0x1c00cd::
	text "우움 @"
	text_ram wStringBuffer1
	text "인가……"
	line "꽤"
	cont "좋은 별명을 붙였군"

	para "하지만"
	line "더 좋은 이름"

	para "내가 붙여줄까?"
	line "어떤가?"
	done

UnknownText_0x1c0142::
	text "그래? 그럼"
	line "어떤 별명으로 해 볼까"
	prompt

UnknownText_0x1c0171::
	text "전 보다도 좋은 이름이지 않은가"
	line "잘되었네!"
	done

UnknownText_0x1c019e::
	text "그런가"
	line "알겠네 또 오거라"
	done

UnknownText_0x1c01be::
	text "움 @"
	text_ram wStringBuffer1
	text "인가!"
	line "이건 대단한 별명이군"
	cont "나쁜건 조금도 없군!"

	para "계속 @"
	text_ram wStringBuffer1
	text "를(을)"
	line "귀여워해 주거라!"
	done

UnknownText_0x1c0208::
	text "어이어이……"
	line "그건 알이잖아"
	done

UnknownText_0x1c0222::
	text "전이랑 비슷하게 보이겠지만"
	line "이쪽이 단연 뛰어나지!"
	cont "잘 되었지!"
	done

UnknownText_0x1c0272::
	text "좋아, 이제부터"
	line "이녀석은"
	cont "@"
	text_ram wStringBuffer1
	text "(이)다!"
	prompt

Text_Gained::
	text "@"
	text_ram wStringBuffer1
	text "는(은)@@"

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	text "많은 양의"
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " 경험치를 얻었다!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " 경험치를 얻었다!"
	prompt

Text_GoMon::
	text "가랏! @@"

Text_DoItMon::
	text "나가랏! @@"

Text_GoForItMon::
	text "힘내라!"
	line "@@"

Text_YourFoesWeakGetmMon::
	text "상대가 약해져 있다!"
	line "찬스닷! @@"

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text "@@"

Text_ThatsEnoughComeBack::
	text "이젠 됐어"
	line "돌아와!@@"

Text_OKComeBack::
	text "좋아!"
	line "돌아와랏!@@"

Text_GoodComeBack::
	text "잘 싸웠다!"
	line "돌아와!@@"

Text_ComeBack::
	text ""
	line "돌아와!"
	done

UnknownText_0x1c0373::
	text "기술 머신을 가동시켰다!"
	prompt

UnknownText_0x1c0384::
	text "비전 머신을 가동시켰다!"
	prompt

UnknownText_0x1c0396::
	text "안에는 @"
	text_ram wStringBuffer2
	text "(이)가"
	line "기록되어져 있다!"

	para "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "포켓몬에게 가르치겠습니까?"
	done

UnknownText_0x1c03c2::
	text "@"
	text_ram wStringBuffer1
	text "과(와)"
	line "@"
	text_ram wStringBuffer2
	text "는(은)"
	cont "상성이 좋지 않았다!"

	para "@"
	text_ram wStringBuffer2
	text "는(은)"
	line "배울 수 없다!"
	prompt

UnknownText_0x1c03fa::
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "더 이상 지닐 수 없습니다!"
	prompt

UnknownText_0x1c0421::
	text "@"
	text_ram wStringBuffer1
	text "를(을)"
	line "손에 넣었다!"
	prompt

UnknownText_0x1c0436::
	text "통신을 중지했습니다"
	prompt

UnknownText_0x1c0454::
	text "통신 에러"
	prompt

UnknownText_0x1c046a::
	text "준비가 되어있지 않습니다"
	line "포켓몬 센터에 가보자!"
	prompt

UnknownText_0x1c048e::
	text "상대의 준비가 되어있지 않습니다"
	prompt

UnknownText_0x1c04a7::
	text "이상한 소포는"
	line "하루에 5번밖에는 되지 않습니다!"
	prompt

UnknownText_0x1c04c6::
	text "이상한 소포는 같은 사람으로부터"
	line "하루에 1번만 받을 수 있습니다!"
	prompt

UnknownText_0x1c04e9::
	text "@"
	text_ram wMysteryGiftPartnerName
	text "(으)로부터"
	line "@"
	text_ram wStringBuffer1
	text "(이)가"
	cont "보내졌다"
	prompt

UnknownText_0x1c04fa::
	text "@"
	text_ram wMysteryGiftPartnerName
	text "(으)로부터"
	line "@"
	text_ram wMysteryGiftPlayerName
	text "의 집에"
	cont "@"
	text_ram wStringBuffer1
	text "(이)가"
	cont "보내졌다"
	prompt

UnknownText_0x1c051a::
	text_ram wc850
	text "에게서 명함을"
	line "받았다!"
	prompt

UnknownText_0x1c0531::	
	text_ram wc850
	text "의 명함을"
	line "@"
	text_decimal wd265, 1, 2
	text "번째에 넣었다!"
	prompt

UnknownText_0x1c0555::	
	text "명함 등록을"
	line "그만두었다!"
	prompt

UnknownText_0x1c0573::	
	text "통신을 중지했습니다"
	prompt

UnknownText_0x1c0591::	
	text "통신 에러"
	prompt

_BadgeRequiredText::
	text "새로운 배지를 손에 넣을 때까지"
	line "아직 사용할 수 없습니다!"
	prompt

UnknownText_0x1c05c8::
	text "이곳에서는 사용할 수 없습니다"
	prompt

UnknownText_0x1c05dd::
	text "@"
	text_ram wStringBuffer2
	text "는(은) "
	line "풀베기를 사용했다!"
	prompt

UnknownText_0x1c05ec::
	text "눈앞에 잘릴만한 것이"
	line "없습니다!"
	prompt

UnknownText_0x1c0609::
	text "눈부신 빛이"
	line "주변을 밝게 비춘다……@"
	text_waitbutton
	db "@@"

_UsedSurfText::
	text "@"
	text_ram wStringBuffer2
	text "는(은)"
	line "파도타기를 사용했다!"
	done

_CantSurfText::
	text "여기서는 타는 기술을"
	next "사용할 수 없습니다"
	prompt

_AlreadySurfingText::
	text "이미 파도타기를"
	line "사용하고 있습니다"
	prompt

_AskSurfText::
	text "수면은 조용히 흔들리고 있다"
	line "……파도타기를 사용하겠습니까?"
	done

UnknownText_0x1c068e::
	text_ram wStringBuffer2
	text "는(은) "
	line "폭포오르기를 사용했다!"
	done

UnknownText_0x1c06a3::
	text "커다란 소리를 내며"
	line "물이 흘러 떨어지고 있다!"
	done

UnknownText_0x1c06bf::
	text "엄청 큰 폭포다!"
	line "……폭포오르기를 사용하겠습니까?"
	done

UnknownText_0x1c06de::
	text_ram wStringBuffer2
	text "는(은) "
	line "구멍파기를 사용했다!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER>는(은) 동굴탈출 로프를"
	line "사용했다!"
	done

UnknownText_0x1c0705::
	text "여기서는 사용할 수 없습니다!"
	done

UnknownText_0x1c071a::
	text "마지막에 가까이 왔다"
	line "포켓몬 센터로 돌아갑니다"
	done

UnknownText_0x1c073b::
	text "여기서는 사용할 수 없습니다!"

	para ""
	done

UnknownText_0x1c0751::
	text "이미 괴력을"
	line "발휘하고 있습니다"
	prompt

UnknownText_0x1c0774::
	text_ram wStringBuffer2
	text "는(은)"
	line "괴력을 발휘했다!"
	done

UnknownText_0x1c0788::
	text_ram wStringBuffer1
	text "의 괴력덕분에"
	line "바위를 밀 수 있게 되었다!"
	prompt

UnknownText_0x1c07a0::
	text "커다란 바위지만……"
	line "포켓몬의 기술로 밀 수 있을지도?"

	para "괴력을 사용하겠습니까?"
	done

UnknownText_0x1c07d8::
	text "괴력덕분에"
	line "바위를 밀어 움직이게 했다!"
	done

UnknownText_0x1c07f4::
	text "커다란 바위지만……"
	line "포켓몬의 기술로 밀 수 있을지도?"
	done

UnknownText_0x1c0816::
	text_ram wStringBuffer2
	text "는(은) "
	line "소용돌이를 사용했다"
	prompt

UnknownText_0x1c082b::
	text "세차게 소용돌이치고 있다"

	para "……포켓몬의 기술로"
	line "어떻게 될지도 몰라"
	done

UnknownText_0x1c0864::
	text "앞길을 거친 소용돌이가"
	line "가로막고 있다!"

	para "소용돌이를 사용하겠습니까?"
	done

UnknownText_0x1c0897::
	text_ram wStringBuffer2
	text "는(은) "
	line "박치기를 사용했다!"
	prompt

UnknownText_0x1c08ac::
	text "……없군……"
	done

UnknownText_0x1c08bc::
	text "이런 나무에는"
	line "포켓몬이 있을지도…"

	para "박치기를 사용하겠습니까?"
	done

UnknownText_0x1c08f0::
	text_ram wStringBuffer2
	text "는(은) "
	line "바위깨기를 사용했다!"
	prompt

UnknownText_0x1c0906::
	text "단단해 보이는 바위지만……"
	line "포켓몬의 기술로 부술 수 있을지도"
	done

UnknownText_0x1c0924::
	text "포켓몬의 기술로 부술 수 있겠다!"
	line "……바위깨기를 사용하겠습니까?"
	done

UnknownText_0x1c0958::
	text "오!"
	line "걸렸다! 걸렸다!"
	prompt

UnknownText_0x1c0965::
	text "낚이지 않는군……"
	prompt

UnknownText_0x1c0979::
	text "이곳에는 아무것도"
	line "없는 것 같다"
	prompt

UnknownText_0x1c099a::
	text "이곳에서는 내릴 수 없다!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer2
	text "에 탔다"
	done

UnknownText_0x1c09c7::
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer2
	text "로부터 내렸다"
	done

UnknownText_0x1c09dd::
	text "……이 나무는 어쩐지"
	line "베어질 것 같다!"

	para "풀베기로 베겠습니까?"
	done

UnknownText_0x1c0a05::
	text "이 나무는 어쩐지"
	line "베어질 것 같다!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer3
	text "를(을)"
	cont "발견했다!"
	done

UnknownText_0x1c0a2c::
	text "그러나 <PLAYER>는(은)"
	line "더 이상 도구를 지닐 수 없다!"
	done

UnknownText_0x1c0a4e::
	text "<PLAYER>의 곁에는"
	line "싸울 수 있는 포켓몬이 없다!"

	para "<PLAYER>는(은)"
	line "눈앞이 깜깜해졌다!"
	done

UnknownText_0x1c0a77::
	text "옷!"
	line "머신이 반응하고 있어!"
	cont "근처에 도구가 묻혀있다!"
	prompt

UnknownText_0x1c0aa9::
	text "…… …… 후우!"
	line "…… 아무것도 반응하지 않는군"
	prompt

UnknownText_0x1c0acc::
	text "@"
	text_ram wStringBuffer3
	text "는(은)"
	line "힘이 빠졌다"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER>의 곁에는"
	line "싸울 수 있는 포켓몬이 없다!"

	para "<PLAYER>는(은)"
	line "눈앞이 깜깜해졌다!"
	prompt

UnknownText_0x1c0b03::
	text "@"
	text_ram wStringBuffer3
	text "는(은)"
	line "달콤한 향기를 사용했다!"
	done

UnknownText_0x1c0b1a::
	text "……이곳에는"
	line "아무것도 없는 것 같다……"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER>는(은) 물을 뿌렸다!"
	line "……아무것도 일어나지 않는다"
	done

UnknownText_0x1c0b65::
	text "<PLAYER>의 포켓몬은"
	line "모두 건강해졌다!"
	done

Text_AnEGGCantHoldAnItem::
	text "알에게는"
	line "물건을 지니게 할 수 없습니다!"
	prompt

UnknownText_0x1c0b9a::
	text "들고갈 수 없습니다"
	done

UnknownText_0x1c0ba5::
	text "몇 개 버리시겠습니까?"
	done

UnknownText_0x1c0bbb::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line " @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "개"
	cont "버려도 괜찮겠습니까?"
	done

UnknownText_0x1c0bd8::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "버렸습니다!"
	prompt

UnknownText_0x1c0bee::
	text "오박사님의 말씀……"
	line "<PLAYER>야(아)! 이런 것에는"
	cont "사용할 때가 따로 있는 법!"
	prompt

Text_YouDontHaveAMon::
	text "포켓몬을 가지고갈 수 없습니다!"
	prompt

UnknownText_0x1c0c2e::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "편리버튼에 등록했다!"
	prompt

UnknownText_0x1c0c45::
	text "그 도구는"
	line "등록할 수 없습니다!"
	prompt

UnknownText_0x1c0c63::
	text "어디로"
	line "이동하겠습니까?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "전투 중에는"
	line "할 수 없습니다!"
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "당신은 남자입니까?"
	line "아니면 여자입니까?"
	done

UnknownText_0x1c0cc6::
	text "<USER>의"
	line "@"
	text_ram wStringBuffer2
	text "(이)가@@"
	text "@"

UnknownText_0x1c0cd0::
	interpret_data
	text "<SCROLL>부쩍 올랐다!"
	prompt

UnknownText_0x1c0ce0::
	text " 올랐다!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>의"
	line "@"
	text_ram wStringBuffer2
	text "(이)가@@"
	text "@"

UnknownText_0x1c0cf5::
	interpret_data
	text "<SCROLL>확 떨어졌다!"
	prompt

UnknownText_0x1c0d06::
	text " 떨어졌다!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@@"

UnknownText_0x1c0d12::
	text "의 주변에서"
	line "공기가 소용돌이를 감는다!"
	prompt

UnknownText_0x1c0d26::
	text "는(은)"
	line "빛을 흡수했다!"
	prompt

UnknownText_0x1c0d3a::
	text "는(은)"
	line "목을 집어넣었다!"
	prompt

UnknownText_0x1c0d4e::
	text "는(은)"
	line "세찬 빛이 감싼다!"
	prompt

UnknownText_0x1c0d5c::
	text "는(은)"
	line "하늘높이 날아올랐다!"
	prompt

UnknownText_0x1c0d6c::
	text "는(은)"
	line "구멍을 파서 땅속으로 숨었다!"
	prompt

_ActorNameText::
	text "<USER>@@"

_UsedMove1Text::
	text "의 @@"

_UsedMove2Text::
	text "는(은) @@"

_UsedInsteadText::
	text "명령을 무시하고@@"

_MoveNameText::
	text ""
	line "@"
	text_ram wStringBuffer2
	db "@@"

_EndUsedMove1Text::
	text "를(을) 사용했다!"
	done

_EndUsedMove2Text::
	text "했다!"
	done

_EndUsedMove3Text::
	text "를(을) 했다!"
	done

_EndUsedMove4Text::
	text " 공격!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "얼라리…………?"

	para "@@"

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text "알이 부화해서"
	line "@"
	text_ram wStringBuffer1
	text "(이)가"
	cont "태어났다!@"
	sound_caught_mon
	text_waitbutton
	db "@@"

UnknownText_0x1c0dd8::
	text "태어난 @"
	text_ram wStringBuffer1
	text "에게"
	line "별명을 붙이겠습니까?"
	done

UnknownText_0x1c0df3::
	text "보모 할머니에게 맡겼던"
	line "@"
	text_ram wBreedMon2Nick
	text "(이)다"
	done

UnknownText_0x1c0e24::
	text "보모 할아버지에게 맡겼던"
	line "@"
	text_ram wBreedMon1
	text "(이)다"
	done

UnknownText_0x1c0e54::
	text "기운이 넘친다!"
	prompt

UnknownText_0x1c0e6f::
	text "@"
	text_ram wStringBuffer1
	text "에게는 전혀"
	line "흥미가 없는 것 같다"
	prompt

UnknownText_0x1c0e8d::
	text "@"
	text_ram wStringBuffer1
	text "를(을) 매우"
	line "마음에 들어하고 있는 듯 하다!"
	prompt

UnknownText_0x1c0eac::
	text "@"
	text_ram wStringBuffer1
	text "(이)랑은 매우"
	line "사이가 좋은 듯 하다"
	prompt

UnknownText_0x1c0ec6::
	text "@"
	text_ram wStringBuffer1
	text "을(를) 약간"
	line "걱정하고 있는 듯 하다"
	prompt

_EmptyMailboxText::
	text "메일은 1통도"
	line "없습니다"
	prompt

ClearedMailPutAwayText::
	text "내용을 지운 메일을"
	line "가방에 넣었습니다"
	prompt

MailPackFullText::
	text "가방이 가득 차서"
	line "메일이 들어갈 수 없습니다!"
	prompt

MailMessageLostText::
	text "내용이 지워져버리겠지만"
	line "괜찮습니까?"
	done

MailAlreadyHoldingItemText::
	text "이미 도구를 지니고 있어서"
	line "메일을 지니게할 수 없습니다"
	prompt

MailEggText::
	text "알에게는 들게 할 수 없습니다!"
	prompt

MailMovedFromBoxText::
	text "박스로부터 메일을 복사했습니다"
	prompt

Text_WasSentToBillsPC::
	text "@"
	text_ram wStringBuffer1
	text "는(은) 이수재"
	line "가 있는 곳에 전송되어졌다!"
	prompt

UnknownText_0x1c1006::
	text "포켓몬을 가지고있지 않는 놈은"
	line "거절이야!"
	prompt

UnknownText_0x1c1024::
	text "뭐 할꺼야?"
	done

UnknownText_0x1c102b::
	text "메일을 가지고 있는"
	line "포켓몬이 있습니다"
	cont "메일을 받아주세요"
	prompt

UnknownText_0x1c1062::
	text "1마리도 가지고있지 않냐?"
	prompt

UnknownText_0x1c1080::
	text "그걸 맡기면"
	line "곤란하게되지 않겠니?"
	prompt

UnknownText_0x1c10a2::
	text "그이상 잘 정리하지 않으면"
	line "포켓몬 지닐 수 없을껄!"
	prompt

UnknownText_0x1c10c0::
	text "@"
	text_ram wStringBuffer1
	text "를(을)"
	line "잡았다!"
	prompt

UnknownText_0x1c10cf::
	text "포켓몬을 바꿔 넣을래?"
	done

UnknownText_0x1c10dd::
	text "이미 "
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "잡아놓았습니다"
	prompt

ContestJudging_FirstPlaceText::
	text "그리고! 이번 대회"
	line "1등의 우승자는@"
	interpret_data
	text ""

	para "@"
	text_ram wBugContestWinnerName
	text "를(을) 잡은"
	line "@"
	text_ram wStringBuffer1
	text "님!@@"

ContestJudging_FirstPlaceScoreText::
	text_start

	para "득점은 @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text "점 입니다!"
	prompt

ContestJudging_SecondPlaceText::
	text "2등은 @"
	text_ram wBugContestWinnerName
	text "를(을)"
	line "잡은 @"
	text_ram wStringBuffer1
	text "님@@"

ContestJudging_SecondPlaceScoreText::
	text_start

	para "득점은 @"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text "점 입니다!"
	prompt

ContestJudging_ThirdPlaceText::
	text "3등은 @"
	text_ram wBugContestWinnerName
	text "를(을)"
	line "잡은 @"
	text_ram wStringBuffer1
	text "님@@"

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "득점은 @"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text "점 입니다!"
	prompt

UnknownText_0x1c1203::
	text "그럼 너의 잉어킹"
	line "크기를 재보겠다"

	para "@"
	limited_interpret_data 3
	text "움 @"
	text_ram wStringBuffer1
	text "cm!"
	prompt

UnknownText_0x1c123a::
	text "현재의 기록"
	line "@"
	text_ram wStringBuffer1
	text "cm"
	cont "@"
	text_ram wMagikarpRecordHoldersName
	text_waitbutton
	db "@@"

UnknownText_0x1c1261::
	text "축하합니다! 당신이"
	line "데리고 있는@"
	text_ram wStringBuffer1
	text "의"

	para "아이디 넘버가 완전히"
	line "일치했습니다"
	prompt

UnknownText_0x1c12ae::
	text "축하합니다! 컴퓨터에"
	line "맡겨 놓은@"
	text_ram wStringBuffer1
	text "의"

	para "아이디 넘버가 완벽하게"
	line "일치했습니다"
	prompt

UnknownText_0x1c12fc::
	text "받은 @"
	text_ram wStringBuffer1
	text "에게"
	line "이름을 붙이겠습니까?"
	done

UnknownText_0x1c1328::
	text "삐-익!"
	line "포켓몬을 가지고있지 않는"
	cont "사람은 사용 할 수 없습니다!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER>는(은)"
	line "컴퓨터의 스위치를 넣었다!"
	prompt

UnknownText_0x1c1368::
	text "무엇을 하겠습니까?"
	done

_PlayersPCHowManyWithdrawText::
	text "몇 개를 꺼내겠습니까?"
	done

_PlayersPCWithdrewItemsText::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "개 "
	cont "꺼냈습니다"
	prompt

_PlayersPCNoRoomWithdrawText::
	text "지닌 물건이 잔뜩 있어서"
	line "꺼낼 수 없습니다!"
	prompt

UnknownText_0x1c13df::
	text "도구를 하나도"
	line "가지고 있지 않아!"
	prompt

_PlayersPCHowManyDepositText::
	text "몇 개를 맡기겠습니까?"
	done

_PlayersPCDepositItemsText::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "개 "
	cont "맡겼습니다"
	prompt

_PlayersPCNoRoomDepositText::
	text "도구가 가득 있습니다"
	line "더 이상 맡길 수 없습니다!"
	prompt

UnknownText_0x1c144d::
	text "<PLAYER>는(은)"
	line "컴퓨터의 스위치를 켰다!"
	prompt

UnknownText_0x1c1462::
	text "어느 곳의 컴퓨터와 연결해서"
	line "통신하겠습니까?"
	done

UnknownText_0x1c1474::
	text "이수재의 컴퓨터와 연결했다!"

	para "포켓몬 맡김 시스템을"
	line "불러냈습니다!"
	prompt

UnknownText_0x1c14a4::
	text "자신의 컴퓨터와 연결했다!"

	para "도구 맡김 시스템을"
	line "불러냈습니다!"
	prompt

UnknownText_0x1c14d2::
	text "오박사의 컴퓨터와 연결했다!"

	para "포켓몬 도감"
	line "평가 시스템을 불러냈습니다!"
	prompt

UnknownText_0x1c1505::
	text "…… …… ……"
	line "…… …… 통신 종료!"
	done

_OakPCText1::
	text "현재의 포켓몬 도감을"
	line "평가받겠습니까?"
	done

_OakPCText2::
	text "포켓몬 도감의"
	line "현재 완성도……"
	prompt

_OakPCText3::
	text "발견한 포켓몬 @"
	text_ram wStringBuffer3
	text ""
	line "잡은 포켓몬 @"
	text_ram wStringBuffer4
	text "!"

	para "오박사의 평가……"
	line "…… …… ……"
	done

_OakRating01::
	text "여기저기의 풀숲에 들어가"
	line "포켓몬을 잡는 것이다!"
	done

_OakRating02::
	text "움! 몬스터볼의"
	line "사용방법은 알고있는 것 같군!"
	done

_OakRating03::
	text "그럭저럭 적응된 것 같구나"
	line "하지만 아직도 갈 길은 멀단다!"
	done

_OakRating04::
	text "포켓몬 도감으로는 아직"
	line "양이 부족해! 여러"
	cont "종류의 포켓몬을 잡도록 하거라!"
	done

_OakRating05::
	text "후움, 열심히 하고 있군"
	line "그런대로 포켓몬 도감"
	cont "답게 되어가고 있단다!"
	done

_OakRating06::
	text "키워서 진화하는 것"
	line "돌의 영향으로 진화하는 것"
	cont "여러 포켓몬이 있단다!"
	done

_OakRating07::
	text "낚싯대는 손에 넣었는가?"
	line "여기저기서 낚시를 한다면"
	cont "더욱 많이 모을 수 있단다!"
	done

_OakRating08::
	text "굉장하군!"
	line "너는 물건을 수집하는 것을"
	cont "좋아하지?"
	done

_OakRating09::
	text "정해진 시간대밖에 움직이지"
	line "않는 포켓몬이 있다고 한다"
	done

_OakRating10::
	text "페이지도 늘어난 것 같구나!"
	line "그 상태로 더욱 열심히 하거라!"
	done

_OakRating11::
	text "호오! 흥미가 생기는구나!"
	line "잡는 것뿐만 아니라"
	cont "진화도 시켜놓거라!"
	done

_OakRating12::
	text "강집이란 사람과는 만났나?"
	line "볼을 만들어 받으면"
	cont "모으는 것도 순조롭다고 생각한다!"
	done

_OakRating13::
	text "옷! 생각해보면 저번에"
	line "조사했을 때보다도"
	cont "많은 포켓몬이 발견되었었지"
	done

_OakRating14::
	text "친구들과 교환하고 있는가?"
	line "혼자서는 매우 힘들테니까"
	done

_OakRating15::
	text "뭐랏! 200종류를 넘었다고!"
	line "이것은 대단히 좋은 도감이"
	cont "될 것 같구나! 기대하겠다!"
	done

_OakRating16::
	text "이렇게 발견할줄은……"
	line "이번 포켓몬 연구는"
	cont "너의 덕분이다!"
	done

_OakRating17::
	text "대단해! 말할 것도 없다!"
	line "너는 포켓몬 박사가 될꺼야!"
	done

_OakRating18::
	text "여기까지 도감이 만들어졌다면"
	line "이미 프로의 경지다!"
	done

_OakRating19::
	text "오옷 꿈에서도 그리던"
	line "퍼펙트한 도감의"
	cont "완성이구나!…… 축하한다!"
	done

_OakPCText4::
	text "…… 오박사의 컴퓨터와의"
	line "접속을 끝냈다!"
	done

UnknownText_0x1c1a5b::
	text " 잘먹을께!"
	done

UnknownText_0x1c1a65::
	text "안됐다……"
	done

UnknownText_0x1c1a6c::
	text "대회를"
	line "끝내겠습니까?"
	done

UnknownText_0x1c1a90::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "몇 개 버리겠습니까?"
	done

UnknownText_0x1c1aad::
	text "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "개"
	cont "버려도 되겠습니까?"
	done

UnknownText_0x1c1aca::
	text "@"
	text_ram wStringBuffer1
	text "를(을)"
	line "버렸습니다!"
	prompt

UnknownText_0x1c1adf::
	text "그것은 매우 중요한 것 입니다!"
	line "버리는 것은 할 수 없습니다!"
	prompt

UnknownText_0x1c1b03::
	text "오박사의 말씀……"
	line "<PLAYER>야(아)! 그런 것은"
	cont "사용할 때가 따로 있단다!"
	done

UnknownText_0x1c1b2c::
	text "@"
	text_ram wMonOrItemNameBuffer
	text "(이)가"
	line "가지고 있던"
	cont "@"
	text_ram wStringBuffer1
	text "를(을) 맡아서"
	para "@"
	text_ram wStringBuffer2
	text "를(을)"
	line "지니게 했다!"
	prompt

UnknownText_0x1c1b57::
	text "@"
	text_ram wMonOrItemNameBuffer
	text "에게"
	line "@"
	text_ram wStringBuffer2
	text "를(을)"
	cont "지니게 했다!"
	prompt

UnknownText_0x1c1b6f::
	text "메일을 풀지않으면"
	line "도구는 지닐 수 없습니다!"
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text "는(은)"
	line "아무것도 지니고 있지 않습니다!"
	prompt

UnknownText_0x1c1baa::
	text "도구가 잔뜩 있어서"
	line "지닌 물건을 맡을 수 없습니다!"
	prompt

UnknownText_0x1c1bc4::
	text "@"
	text_ram wMonOrItemNameBuffer
	text "(으)로부터"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "맡았습니다!"
	prompt

UnknownText_0x1c1bdc::
	text "@"
	text_ram wMonOrItemNameBuffer
	text "는(은)"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "이미 지니고 있습니다"

	para "들고 있는 도구를"
	line "바꾸겠습니까?"
	done

UnknownText_0x1c1c09::
	text "이 도구는"
	line "지닐 수가 없습니다!"
	prompt

UnknownText_0x1c1c22::
	text "메일을 읽으면 메세지가"
	line "사라져버립니다만 괜찮습니까?"
	done

UnknownText_0x1c1c47::
	text "@"
	text_ram wStringBuffer1
	text "에게서 메일을"
	line "받았습니다!"
	prompt

UnknownText_0x1c1c62::
	text "도구가 잔뜩 있어서"
	line "메일을 받을 수 없습니다"
	prompt

UnknownText_0x1c1c86::
	text "받은 메일을 컴퓨터에"
	line "전송하겠습니까?"
	done

UnknownText_0x1c1ca9::
	text "컴퓨터의 메일박스가"
	line "가득 찼습니다!"
	prompt

UnknownText_0x1c1cc4::
	text "메일을 컴퓨터에"
	line "전송했습니다"
	prompt

UnknownText_0x1c1ce3::
	text "체력이 부족합니다!"
	prompt

UnknownText_0x1c1cf3::
	text "가방에 넣어둔 도구를"
	line "편리버튼에 등록할 수 있습니다"
	done

_OakText1::
	text "이야- 오래 기다리게 했다!"

	para "포켓몬스터의 세계에"
	line "잘왔단다!"

	para "나의 이름은 오박사"

	para "모두로부터는 포켓몬박사라고"
	line "존경받고 있단다"
	prompt

_OakText2::
	text "포켓몬스터………포켓몬"
	para "이 세계에는"
	line "포켓몬스터라고 불려지는"
	cont "생명체들이"
	cont "도처에 살고있다!@@"

_OakText3::
	text_waitbutton
	db "@@"

_OakText4::
	text "사람은 포켓몬들과"
	line "정답게 지내거나"
	cont "함께 싸우거나…………"
	cont "서로 도와가며"
	cont "살아가고 있단다"
	prompt

_OakText5::
	text "하지만 우리들은 포켓몬 전부를"
	line "알고 있지는 못하다"

	para "포켓몬의 비밀은"
	line "아직도 잔뜩 있다!"

	para "나는 그것을 밝혀내기 위하여"
	line "매일 포켓몬의 연구를"
	cont "계속하고 있다는 말이다!"
	
	prompt
