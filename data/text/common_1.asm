_FruitBearingTreeText::
	text "열매가 열리는 나무가 있다!"
	done

_HeyItsFruitText::
	text "……@"
	text_ram wStringBuffer3
	text "(이)다!"
	done

_ObtainedFruitText::
	text "@"
	text_ram wStringBuffer3
	text "를(을)"
	line "손에 넣었다!"
	done

_FruitPackIsFullText::
	text "……그러나 가방이 가득 찼다!"
	done

_NothingHereText::
	text "아무것도 발견하지 못했다……"
	done

UnknownText_0x1bc06b::
	text "어느 규토리로 만들건가?"
	done

UnknownText_0x1bc089::
	text "몇 개 만들건가?"
	done

UnknownText_0x1bc0a2::
	text "@"
	text_ram wStringBuffer1
	text "의 체력이"
	line "@"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " 회복되었다"
	done

UnknownText_0x1bc0bb::
	text "@"
	text_ram wStringBuffer1
	text "의 독은"
	line "깨끗이 사라졌다!"
	done

UnknownText_0x1bc0d2::
	text "@"
	text_ram wStringBuffer1
	text "의 몸에"
	line "마비가 사라졌다"
	done

UnknownText_0x1bc0ea::
	text "@"
	text_ram wStringBuffer1
	text "의"
	line "화상이 회복되었다"
	done

UnknownText_0x1bc101::
	text "@"
	text_ram wStringBuffer1
	text "의 몸에"
	line "얼음이 녹았다"
	done

UnknownText_0x1bc115::
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "눈을 떴다"
	done

UnknownText_0x1bc123::
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "건강하게 되었다!"
	done

UnknownText_0x1bc13a::
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "기운을 되찾았다!"
	done

UnknownText_0x1bc14f::
	text "@"
	text_ram wStringBuffer1
	text "의 레벨이"
	line "@"
	text_decimal wCurPartyLevel, 1, 3
	text "(으)로 되었다@"
	sound_dex_fanfare_50_79
	text_waitbutton
	db "@@"

UnknownText_0x1bc16e::
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "제 정신을 차렸다!"
	done

UnknownText_0x1bc187::
	text "좋아하는 4자리 숫자를"
	line "입력해주십시오"
	done

UnknownText_0x1bc1ac::
	text "확인을 위하여 다시 한번"
	line "똑같은 숫자를 입력해주세요"
	done

UnknownText_0x1bc1cf::
	text "똑같은 숫자가 아닙니다"

	para ""
	done

UnknownText_0x1bc1eb::
	text "비밀번호가 결정되었습니다!"

	para "다음부터 명함 폴더를"
	line "열 때는 이 번호를"
	cont "입력해주십시오"

	para ""
	done

UnknownText_0x1bc23e::
	text "0000은 사용할 수 없습니다!"

	para ""
	done

UnknownText_0x1bc251::
	text "명함 폴더의"
	next "비밀번호를 입력해주십시오"
	done

UnknownText_0x1bc272::
	text "비밀번호가"
	line "틀립니다!"

	para ""
	done

UnknownText_0x1bc288::
	text "명함 폴더를 열었습니다!@"

UnknownText_0x1bc29c::
	text "………………………………"
	line "………………………………"

	para "움- 음냐 음냐……"
	line "뭐야 벌써 이런 시간이……"
	cont "미안하지만 시계를 봐 주겠니?…"
	prompt

UnknownText_0x1bc2eb::
	text "지금은 몇시인가?"
	done

UnknownText_0x1bc2fd::
	text "뭐야! @@"

UnknownText_0x1bc305::
	text " 라고?"
	done

UnknownText_0x1bc308::
	text "그래서 몇 분이라고?"
	done

UnknownText_0x1bc31b::
	text "뭐라! @@"

UnknownText_0x1bc323::
	text "?"
	done

UnknownText_0x1bc326::
	text "!"
	line "이런! 마냥 잠만 잔 것 같군"
	done

UnknownText_0x1bc336::
	text "!"
	line "큰일이군! 거의 잠으로 때웠다!"
	done

UnknownText_0x1bc34f::
	text "!"
	line "과연 어두운 것 같군!"
	done

UnknownText_0x1bc369::
	text "오늘은 무슨 요일?"
	done

UnknownText_0x1bc37a::
	text "설마 틀리지는 않았겠지?"
	done

UnknownText_0x1bc42c::
	text "패스워드는"
	line "      입니다"
	done

UnknownText_0x1bc43f::
	text "이것으로 정하겠습니까?"
	done

UnknownText_0x1bc44c::
	text "ID 를"
	line "입력"
	done

UnknownText_0x1bc45e::
	text "돈을"
	line "입력"
	done

UnknownText_0x1bc471::
	text "고를 수 있는 것이 없습니다!"
	prompt

UnknownText_0x1bc48c::
	text "어느 쪽으로 배치하겠습니까?"
	done

UnknownText_0x1bc4b2::
	text "어느 쪽을 정리하겠습니까?"
	done

UnknownText_0x1bc4d7::
	text "@"
	text_ram wStringBuffer3
	text "를(을)"
	line "정리했다"
	prompt

UnknownText_0x1bc4ec::
	text "정리할 것이 없습니다"
	prompt

UnknownText_0x1bc509::
	text "@"
	text_ram wStringBuffer3
	text "를(을)"
	line "놓아두었습니다"
	prompt

UnknownText_0x1bc51c::
	text "@"
	text_ram wStringBuffer3
	text "를(을) 치우고"
	line "@"
	text_ram wStringBuffer4
	text "를(을)"
	cont "놓아두었습니다"
	prompt

UnknownText_0x1bc546::
	text "이미 놓여져 있습니다"
	prompt

UnknownText_0x1bc55d::
	text "마을지도가 있다!"
	done

UnknownText_0x1bc570::
	text "귀여운 피카츄의 포스터다"
	done

UnknownText_0x1bc591::
	text "귀여운 삐삐의 포스터다"
	done

UnknownText_0x1bc5b3::
	text "귀여운 푸린의 포스터다"
	done

UnknownText_0x1bc5d7::
	text "@"
	text_ram wStringBuffer3
	text "(이)가 있다!"
	done

UnknownText_0x1bc5ef::
	text "커다란 인형이 있다!"
	line "푹신하고 기분 좋을 것 같은……"
	done

UnknownText_0x1bc615::
	text "여보세요"
	line "<PLAYER> 안녕?"
	prompt

UnknownText_0x1bc62a::
	text "어제 쇼핑을 갔다가"
	line "좋아 보이는 도구를 팔고 있어서"
	prompt

UnknownText_0x1bc64e::
	text "<PLAYER>의 돈으로"
	line "사버렸어! 미안!"
	prompt

UnknownText_0x1bc673::
	text "그렇지만 컴퓨터에 넣어두었으니까"
	line "쓰거라! 반드시 도움이 될 꺼야!"
	done

UnknownText_0x1bc693::
	text "어제 쇼핑을 갔다가"

	para "아주 귀여운"
	line "인형을 팔고있기에……"
	prompt

UnknownText_0x1bc6c7::
	text "방에 놓아두었으니까 보거라!"
	line "꼭 마음에 들꺼라고 생각해!"
	done

UnknownText_0x1bc6e9::
	text "@"
	text_ram wPlayerTrademonSpeciesName
	text "는(은) 무사히"
	line "@"
	text_ram wOTTrademonSenderName
	text "에게 맡겨졌습니다"
	done

UnknownText_0x1bc701::
	text_start
	done

UnknownText_0x1bc703::
	text "@"
	text_ram wOTTrademonSenderName
	text "(이)가"
	line "석별의 정을 아쉬워하며"
	done

UnknownText_0x1bc719::
	text "@"
	text_ram wOTTrademonSpeciesName
	text "를(을)"
	line "보냅니다"
	done

UnknownText_0x1bc71f::
	text "@"
	text_ram wOTTrademonSpeciesName
	text "를(을)"
	line "귀여워해 주세요"
	done

UnknownText_0x1bc739::
	text "@"
	text_ram wPlayerTrademonSenderName
	text "(이)가"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "를(을) 보내는 대신"
	done

UnknownText_0x1bc74c::
	text "@"
	text_ram wOTTrademonSenderName
	text "는(은)"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "를(을) 줍니다"
	done

UnknownText_0x1bc75e::
	text "이제부터"
	line "@"
	text_ram wOTTrademonSenderName
	text "의 @"
	text_ram wOTTrademonSpeciesName
	text "과(와)"
	db "@@"

UnknownText_0x1bc774::
	text "@"
	text_ram wPlayerTrademonSenderName
	text "의 @"
	text_ram wPlayerTrademonSpeciesName
	text "를(을)"
	line "교환합니다!"
	done

UnknownText_0x1bc787::
	text "이제부터"
	line "@"
	text_ram wPlayerTrademonSenderName
	text "의 @"
	text_ram wPlayerTrademonSpeciesName
	text "과(와)"
	db "@@"

UnknownText_0x1bc79d::
	text "@"
	text_ram wOTTrademonSenderName
	text "의 @"
	text_ram wOTTrademonSpeciesName
	text "를(을)"
	line "교환합니다!"
	done

UnknownText_0x1bc7b0::
	text "이제부터 @"
	text_ram wPlayerTrademonSenderName
	text "의@"
	text_ram wPlayerTrademonSpeciesName
	text "를(을)"
	line "전송합니다!"
	done

UnknownText_0x1bc7c3::
	text "@"
	text_ram wOTTrademonSpeciesName
	text "를(을)"
	line "귀여워해 주세요"
	done

UnknownText_0x1bc7dd::
	text "이제부터 @"
	text_ram wPlayerTrademonSenderName
	text "의@"
	text_ram wPlayerTrademonSpeciesName
	text "를(을)"
	line "전송합니다!"
	done

UnknownText_0x1bc7f0::
	text "@"
	text_ram wOTTrademonSpeciesName
	text "를(을)"
	line "귀여워해 주세요"
	done

UnknownText_0x1bc80a::
	text_ram wOTTrademonSpeciesName
	text "(이)가"
	line "되돌아왔습니다!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "호두『오박사님의"
	done

_OPT_IntroText2::
	text_start
	line "포켓몬 강좌!"
	done

_OPT_IntroText3::
	text_start
	line "함께하는 진행자는 호두입니다!"
	done

_OPT_OakText1::
	text_start
	line "오박사『@"
	text_ram wMonOrItemNameBuffer
	text "는(은)"
	db "@@"

_OPT_OakText2::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "에서"
	done

_OPT_OakText3::
	text_start
	line "서식하고 있는 것 같다"
	done

_OPT_MaryText1::
	text_start
	line "호두『@"
	text_ram wStringBuffer1
	text "(이)라는 것은 "
	done

OPT_SweetAdorably::
	text_start
	line "눈에 넣어도 아프지 않을 정도로"
	done

OPT_WigglySlickly::
	text_start
	line "꿈틀꿈틀하고서"
	done

OPT_AptlyNamed::
	text_start
	line "이름 그대로"
	done

OPT_UndeniablyKindOf::
	text_start
	line "정말 말을 듣고보니까"
	done

OPT_Unbearably::
	text_start
	line "더 이상 참을 수 없을 정도로"
	done

OPT_WowImpressively::
	text_start
	line "이것이 꽤나 어째서"
	done

OPT_AlmostPoisonously::
	text_start
	line "색이 강렬해서"
	done

OPT_Sensually::
	text_start
	line "야하게 보이고"
	done

OPT_Mischievously::
	text_start
	line "도깨비처럼"
	done

OPT_Topically::
	text_start
	line "근처에서도 소문이 자자할 정도로"
	done

OPT_Addictively::
	text_start
	line "나쁜 버릇이 될 정도로"
	done

OPT_LooksInWater::
	text_start
	line "강 근처에서"
	done

OPT_EvolutionMustBe::
	text_start
	line "진화하거나 뭔가를 하면"
	done

OPT_Provocatively::
	text_start
	line "여러 의미로"
	done

OPT_FlippedOut::
	text_start
	line "뒤집어본다면"
	done

OPT_HeartMeltingly::
	text_start
	line "지켜주고 싶을 정도로"
	done

OPT_Cute::
	text_start
	line "귀엽지요"
	done

OPT_Weird::
	text_start
	line "이상해-"
	done

OPT_Pleasant::
	text_start
	line "기분이 좋군요"
	done

OPT_BoldSortOf::
	text_start
	line "약간 대담하다고 하는 기분"
	done

OPT_Frightening::
	text_start
	line "무섭지 않니?"
	done

OPT_SuaveDebonair::
	text_start
	line "순조롭게 진행되고 있는 것 같네!"
	done

OPT_Powerful::
	text_start
	line "강하구나-"
	done

OPT_Exciting::
	text_start
	line "박력이 있어 보여"
	done

OPT_Groovy::
	text_start
	line "현대적인 감각이구나"
	done

OPT_Inspiring::
	text_start
	line "푹 빠져버릴 것 같아-!"
	done

OPT_Friendly::
	text_start
	line "동료로 삼고싶을지도 몰라"
	done

OPT_HotHotHot::
	text_start
	line "몸이 달아오르겠어!"
	done

OPT_Stimulating::
	text_start
	line "감전되겠어!"
	done

OPT_Guarded::
	text_start
	line "소중히 하고싶어!"
	done

OPT_Lovely::
	text_start
	line "헤롱헤롱한 기분!"
	done

OPT_Speedy::
	text_start
	line "동작이 재빠른 것 같네!"
	done

_OPT_PokemonChannelText::
	text "포켓몬"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	db "@@"

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "준화『포켓몬 뮤직"
	done

_BenIntroText2::
	text_start
	line "채널!"
	done

_BenIntroText3::
	text_start
	line "DJ는 준화입니다"
	done

_FernIntroText1::
	text_start
	line "석호『포켓몬 노래의 광장!"
	done

_FernIntroText2::
	text_start
	line "DJ는 석호인 것이다-"
	done

_BenFernText1::
	text_start
	line "오늘은 @"
	current_day
	text "(이)라는 것으로"
	done

_BenFernText2A::
	text_start
	line "포켓몬들도 건강해지는"
	done

_BenFernText2B::
	text_start
	line "포켓몬들도 새근새근 잠드는"
	done

_BenFernText3A::
	text_start
	line "포켓몬 마치!"
	done

_BenFernText3B::
	text_start
	line "포켓몬 자장가다!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "난영『야아! 라디오를 듣고 있어"
	done

_LC_Text2::
	text_start
	line "모두 요즘 상태는 어때?"
	done

_LC_Text3::
	text_start
	line "즐거운 그대도 저기압인 그대도"
	done

_LC_Text4::
	text_start
	line "이번주의 행운의 넘버"
	done

_LC_Text5::
	text_start
	line "이야기 해보자!"
	done

_LC_Text6::
	text_start
	line "그럼 발표합니다"
	done

_LC_Text7::
	text_start
	line "이번주 행운의 넘버는"
	done

_LC_Text8::
	text_start
	line "@"
	interpret_data
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "다시한번 이야기합니다"
	done

_LC_Text10::
	text_start
	line "이 숫자가 맞았으면"
	done

_LC_Text11::
	text_start
	line "지금바로 라디오타워로 컴온!"
	done

_LC_DragText1::
	text_start
	limited_interpret_data 3
	text "같은 것만 이야기하면"
	done

_LC_DragText2::
	text_start
	line "피곤해진다구- 뭐"
	done

; Places and People

_PnP_Text1::
	text_start
	line "그때 그사람!"
	done

_PnP_Text2::
	text_start
	line "이 방송은 저 리리스가"
	done

_PnP_Text3::
	text_start
	line "보내드립니다!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "(이)라는 것"
	db "@@"

_PnP_cute::
	text_start
	line "귀엽군요"
	done

_PnP_lazy::
	text_start
	line "나무늘보일지도 몰라"
	done

_PnP_happy::
	text_start
	line "언제나 좋은 기분"
	done

_PnP_noisy::
	text_start
	line "매우 생기 있고"
	done

_PnP_precocious::
	text_start
	line "약간 느림보씨"
	done

_PnP_bold::
	text_start
	line "약간 대담"
	done

_PnP_picky::
	text_start
	line "입만 시끄러운 것 같군요!"
	done

_PnP_sortofok::
	text_start
	line "나름대로…네"
	done

_PnP_soso::
	text_start
	line "나로서는 그럭저럭일지도?"
	done

_PnP_great::
	text_start
	line "정말은 대단할지도 몰라"
	done
	
_PnP_mytype::
	text_start
	line "나한테 있어서는 타입일지도!"
	done

_PnP_cool::
	text_start
	line "잘 활용하고 있다고 생각하지않니?"
	done

_PnP_inspiring::
	text_start
	line "나 푹 빠져버릴 것 같아!"
	done

_PnP_weird::
	text_start
	line "생각해보면 이상해!"
	done

_PnP_rightforme::
	text_start
	line "나에대해 어떻게 생각하고 있을까?"
	done

_PnP_odd::
	text_start
	line "역시 이상해!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "(이)라는 것"
	db "@@"

_RocketRadioText1::
	text_start
	line "……@"
	interpret_data
	text "아-@"
	interpret_data
	text "……@"
	interpret_data
	text "우리들은"
	done

_RocketRadioText2::
	text_start
	line "우는 애도 울음을 그치는 로켓단!"
	done

_RocketRadioText3::
	text_start
	line "조직의 재건을 실행했다"
	done

_RocketRadioText4::
	text_start
	line "3년간의 노력이 결실을 맺었다"
	done

_RocketRadioText5::
	text_start
	line "지금 여기에 로켓단의"
	done

_RocketRadioText6::
	text_start
	line "부활을 선언한다!"
	done

_RocketRadioText7::
	text_start
	line "비주기님! @"
	interpret_data
	text "들리십니까?"
	done

_RocketRadioText8::
	text_start
	line "…… @"
	interpret_data
	text "결국 해냈습니다!"
	done

_RocketRadioText9::
	text_start
	line "두목님은 어디에 계시는 걸까@"
	interpret_data
	line "……?"
	done

_RocketRadioText10::
	text_start
	line "라디오를 듣고 있을까@"
	interpret_data
	line "…… @"
	interpret_data
	line "……"
	done

_BuenaRadioText1::	
	text_start
	line "규화『안녕-! 난 규화야!"
	done

_BuenaRadioText2::	
	text_start
	line "오늘의 암호를 말할게"
	done

_BuenaRadioText3::	
	text_start
	line "으-음 뭐냐 하면…"
	done

_BuenaRadioText4::	
	text_start
	line "『@"
	text_ram wStringBuffer1
	text "』 이야-!"
	done

_BuenaRadioText5::	text_start
	line "잊어버리면 안 돼!"
	done

_BuenaRadioText6::	
	text_start
	line "금빛 라디오타워에서 기다릴 테니까"
	done

_BuenaRadioText7::	
	text_start
	line "모두 오렴-!"
	done

_BuenaRadioMidnightText1::	
	text_start
	line "규화『…어머나"
	done

_BuenaRadioMidnightText2::	
	text_start
	line "벌써 0시잖아!"
	done

_BuenaRadioMidnightText3::	
	text_start
	line "방송 종료해야지!"
	done

_BuenaRadioMidnightText4::	
	text_start
	line "마지막까지 들어줘서"
	done

_BuenaRadioMidnightText5::	
	text_start
	line "고마워-!"
	done

_BuenaRadioMidnightText6::	
	text_start
	line "그치만 늦게까지 안 자면 안 돼!"
	done

_BuenaRadioMidnightText7::	
	text_start
	line "이 방송의 디제이는"
	done

_BuenaRadioMidnightText8::	
	text_start
	line "나 규화가 보내드렸습니다!"
	done

_BuenaRadioMidnightText9::	
	text_start
	line "그럼 이만-!"
	done

_BuenaRadioMidnightText10::	
	text "…"
	done

_BuenaOffTheAirText::	
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>는(은)"
	line "@"
	text_ram wEnemyMonNick
	text "를(을)"
	cont "도로 불러 들였다!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>는(은)"
	line "@"
	text_ram wEnemyMonNick
	text "에게"

	para "@"
	text_ram wMonOrItemNameBuffer
	text "를(을)"
	line "사용했다!"
	prompt

Text_ThatCantBeUsedRightNow::
	text "현재 이 기능은"
	line "사용할 수 없습니다"
	prompt

Text_ThatItemCantBePutInThePack::
	text "도구를 가방에"
	line "넣을 수 없습니다!"
	done

Text_TheItemWasPutInThePack::
	text "@"
	text_ram wStringBuffer1
	text "를(을) "
	line "가방에 넣었습니다"
	done

Text_RemainingTime::
	text "대회 남은 시간"
	done

Text_YourMonsHPWasHealed::
	text "포켓몬의 체력을"
	line "회복시켰습니다"
	prompt

Text_Warping::
	text "워프합니다!"
	done

UnknownText_0x1bd05e::
	text "변경할 번호를"
	line "지정해주십시오"
	done

UnknownText_0x1bd07f::
	text "@"
	text_ram wStringBuffer2
	text "(으)로"
	line "놀겠습니까?"
	done

UnknownText_0x1bd09a::
	text "2개체 없기때문에"
	line "작게 할 수 없습니다"
	prompt

Text_BreedingIsNotPossible::
	text "작게 할 수 없습니다"
	prompt

UnknownText_0x1bd0d8::
	text "상성 @"
	text_decimal wd265, 1, 3
	text "입니다"
	line "작게 하겠습니까?"
	done

UnknownText_0x1bd109::
	text "알이 없어!"
	prompt

UnknownText_0x1bd11c::
	text "태어난다!"
	prompt

UnknownText_0x1bd131::
	text "이벤트@"
	text_decimal wStringBuffer2, 1, 2
	text "를(을)"
	line "테스트 하겠습니까?"
	done

UnknownText_0x1bd188::
	text "박스가 가득!"
	done

UnknownText_0x1bd19a::	
	text_ram wStringBuffer2
	text "에게서 새로운"
	line "명함이 도착했다!"
	done

UnknownText_0x1bd1ba::	
	text "이 명함을 명함 폴더에"
	line "넣으시겠습니까?"
	done

UnknownText_0x1bd1dd::	
	text_ram wStringBuffer2
	text "의 명함을 리스트의"
	line "@"
	text_decimal wStringBuffer1, 1, 2
	text "번째에 넣었다!"
	prompt

UnknownText_0x1bd201::	
	text "통신을 시작합니다!"
	done

UnknownText_0x1bd211::	
	text "통신을 그만두었습니다"
	done

UnknownText_0x1bd223::	
	text "통신을 종료합니다"
	done

UnknownText_0x1bd286::
	text_ram wStringBuffer2
	text "(과)와 @"
	text_ram wStringBuffer1
	text "를(을)"
	line "교환합니다"
	done

UnknownText_0x1bd2a0::
	text "찌리리공배지 넌 내꺼야!!"
	done

UnknownText_0x1bd2bc::
	text "몇층에 가십니까?"
	done

UnknownText_0x1bd2ca::
	text "아나운서『딩동댕!"

	para "시간이 되었습니다!"
	done

UnknownText_0x1bd2e7::
	text "아나운서『곤충채집 대회"
	line "끝났습니다!"
	done

UnknownText_0x1bd308::
	text "스프레이의 효과가 떨어졌다"
	done

UnknownText_0x1bd321::
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer3
	text "를(을)"
	cont "발견했다!"
	done

UnknownText_0x1bd331::
	text "그러나 <PLAYER>는(은)"
	line "도구를 더 이상 지닐 수 없다!"
	done

UnknownText_0x1bd34b::
	text "지금 @"
	text_ram wStringBuffer2
	text "에서"
	line "희귀한 @"
	text_ram wStringBuffer1
	text ""
	cont "를(을) 봤어!"

	para "또 희귀한 포켓몬을"
	line "발견하면 전화할께!"
	prompt

UnknownText_0x1bd39e::
	text "전당등록 데이터를 쓰고 있는 중"
	line "전원을 끊지 말아주세요"
	done

UnknownText_0x1bd3be::
	text "@"
	text_ram wPlayerName
	text "는(은)"
	line "배달원으로부터"
	cont "@"
	text_ram wStringBuffer1
	text "를(을) 받았다@"
	sound_item
	text_waitbutton
	db "@@"

UnknownText_0x1bd3d7::
	text "동전을 가지고 있지 않습니다!"
	prompt

UnknownText_0x1bd3eb::
	text "동전 케이스가 없습니다!!"
	prompt

UnknownText_0x1bd407::
	text "자-"
	line "케이블을 연결해서……그리고"
	prompt

UnknownText_0x1bd429::
	text "<PLAYER>는(은)"
	line "@"
	text_ram wMonOrItemNameBuffer
	text "와(과)"
	cont "@"
	text_ram wStringBuffer2
	text "를(을)"
	cont "교환했다!@@"

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	interpret_data
	db "@@"

UnknownText_0x1bd449::
	text "나, 포켓몬 모으고 있어!"
	line "너는 @"
	text_ram wStringBuffer1
	text "를(을)"
	cont "가지고 있니?"

	para "내 @"
	text_ram wStringBuffer2
	text "(이)랑"
	line "교환할래?"
	done

UnknownText_0x1bd48c::
	text "바꿔주지 않을꺼니?"
	line "쳇, 실망이다……"
	done

UnknownText_0x1bd4aa::
	text "얼라리……?"
	line "@"
	text_ram wStringBuffer1
	text "(이)가 아니야"
	cont "쳇, 유감이로군……"
	done

UnknownText_0x1bd4d2::
	text "신난다!"
	line "@"
	text_ram wStringBuffer1
	text "(이)가"
	cont "손에 들어왔다"
	cont "고마워!"
	done

UnknownText_0x1bd4f4::
	text "야아!"
	line "나랑 바꿨던 @"
	text_ram wStringBuffer2
	text ""
	cont "잘 지내니?"
	done

UnknownText_0x1bd512::
	text "이봐 너……"
	line "찾는 포켓몬이 있는데"

	para "만일 @"
	text_ram wStringBuffer1
	text "를(을)"
	line "가지고 있다면"
	cont "내 @"
	text_ram wStringBuffer2
	text "(이)랑"
	cont "교환하지 않을래?"
	done

UnknownText_0x1bd565::
	text "너도 가지고 있지 않다고?……"
	line "유감이군……"
	done

UnknownText_0x1bd5a1::
	text "@"
	text_ram wStringBuffer1
	text "을(를)"
	line "가지고 있지 않니?"
	cont "그럼 할 수 없군……"
	done

UnknownText_0x1bd5cc::
	text "오오!"
	line "고맙다!"

	para "드디어 @"
	text_ram wStringBuffer1
	text "(이)가"
	line "손에 들어왔어!"
	done

UnknownText_0x1bd5f4::
	text "오오!"

	para "네게 받은 @"
	text_ram wMonOrItemNameBuffer
	text ""
	line "는(은) 매우 건강하단다!"
	done

UnknownText_0x1bd621::
	text "@"
	text_ram wMonOrItemNameBuffer
	text " 귀엽지!"
	line "하지만 나는 가지고 있지 않아……"
	cont "너 @"
	text_ram wStringBuffer1
	text ""
	cont "가지고 있니?"

	para "내 @"
	text_ram wStringBuffer2
	text "(이)랑"
	line "교환하자!"
	done

UnknownText_0x1bd673::
	text "교환하지 않는다구?"
	line "에이…… 실망……"
	done

UnknownText_0x1bd696::
	text "@"
	text_ram wStringBuffer1
	text "(이)가"
	line "아니잖아"
	cont "그거 잡으면 바꿔줘!"
	done

UnknownText_0x1bd6cd::
	text "와아! 고마워!"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " 갖고싶었어!"
	done

UnknownText_0x1bd6f5::
	text "교환했던 @"
	text_ram wStringBuffer2
	text ""
	line "잘 있니?"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "는(은)"
	cont "엄청 귀여워!"
	done

UnknownText_0x1bd731::	
	text "어라? 왜지?"
	done
	
UnknownText_0x1bd745::	
	text "교환이란 건 신기하구나…"
	
	para "아저씨는 아직도"
	line "모르는 게 많단다"
	done

UnknownText_0x1bd77f::
	text "와아 귀여운 포켓몬이네"
	line "어쩐 일이니?"

	para "…………………………"
	line "……그래…… 모험을 떠나는구나"

	para "좋아!"
	line "엄마도 협력해 줄게"
	cont "뭘 할 수 있을까……?"

	para "맞아!"
	line "돈을 맡아줄게"

	para "긴 여행이 될 것 같으니까"
	line "돈을 소중히 해야지!"

	para "어때, 저금할래?"
	done

UnknownText_0x1bd868::
	text "저금한다고?"
	line "맡겨줘!"

	para "…………………………"
	prompt

UnknownText_0x1bd88e::
	text "……몸조심하거라"

	para "포켓몬은 소중한 친구"
	line "힘을 합쳐 분발하는거야"

	para "잘 다녀와라!"
	done

UnknownText_0x1bd8da::
	text "어서오너라!"
	line "열심히하고 있는 것 같네"

	para "2층은 잘 정리되어있단다"
	line "그게 아니면 저금때문이니?"
	done

UnknownText_0x1bd942::
	text "뭘 하겠니?"
	done

UnknownText_0x1bd95b::
	text "얼마 맡길꺼니?"
	done

UnknownText_0x1bd97a::
	text "얼마 찾아갈꺼야?"
	done

UnknownText_0x1bd999::
	text "저금할래?"
	done

UnknownText_0x1bd9ba::
	text "그렇게 많이 맡아두지 않았어"
	prompt

UnknownText_0x1bd9d7::
	text "그렇게 많이 가지고 갈 수 없어"
	prompt

UnknownText_0x1bd9f1::
	text "그렇게 많이 지니고 있지 않잖아"
	prompt

UnknownText_0x1bda0b::
	text "그렇게 맡아둘 수 없어"
	prompt

UnknownText_0x1bda25::
	text "저금한다고?"
	line "맡겨둬!"

	para "<PLAYER>! 힘내라!"
	done

UnknownText_0x1bda5b::
	text "소중히 맡아둘께"
	line "힘내!"
	done

UnknownText_0x1bda7e::
	text "<PLAYER>! 힘내거라!"
	done

UnknownText_0x1bda90::
	text "무리하지 말거라"
	done

UnknownText_0x1bdaa7::
	text_start
	done

UnknownText_0x1bdaa9::
	text "나는 보모 할아버지다"
	line "뭔가 양육시키고싶은가?"
	done

UnknownText_0x1bdad8::
	text "나는 보모 할아버지다"
	line "알에 대한 이야기 해줄까?"

	para "할멈과 포켓몬을 양육하고 있는데"
	line "………깜짝 놀랬단다!"

	para "어쩐지! 알이 있더군!"
	line "이상한 일도 있지"

	para "어떤가?"
	line "네 포켓몬의 양육을 맡겨보겠니?"
	done

UnknownText_0x1bdb85::
	text "나는 보모 할머니다"
	line "뭔가 양육시키고싶은가?"
	done

UnknownText_0x1bdbbb::
	text "나는 보모 할머니다"
	line "알에 대한 이야기 해줄까?"

	para "할아범과 포켓몬을 양육하고 있는데"
	line "………깜짝 놀랬단다!"

	para "어쩐지! 알이 있더군!"
	line "이상한 일도 있지"

	para "어떤가?"
	line "네 포켓몬의 양육을 맡겨보겠니?"
	done

UnknownText_0x1bdc79::
	text "그럼"
	line "어느 것을 양육해보겠니?"
	prompt

UnknownText_0x1bdc97::
	text "으응? 포켓몬이"
	line "1마리밖에 없는 것 같구만"
	prompt

UnknownText_0x1bdcb8::
	text "미안하지만"
	line "알은 맡아줄 수 없단다"
	prompt

UnknownText_0x1bdcda::
	text "그전에"
	line "메일을 빼놓고 오거라"
	prompt

UnknownText_0x1bdcff::
	text "그것을 맡긴다면"
	line "싸울 수 없게 되어버릴껄"
	prompt

UnknownText_0x1bdd30::
	text "알겠다"
	line "잠시 @"
	text_ram wStringBuffer1
	text "를(을)"
	cont "맡아두마"
	prompt

UnknownText_0x1bdd4b::
	text "적당히 시간이 지나면"
	line "또 오너라"
	done

UnknownText_0x1bdd64::
	text "역시 우리들은 천재인가봐!"
	line "너의 @"
	text_ram wStringBuffer1
	text " 봐 볼까"
	done

UnknownText_0x1bdd96::
	text "자네의 @"
	text_ram wStringBuffer1
	text ""
	line "꽤 성장했단다"

	para "그렇지, 레벨로 말하자면"
	line "@"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "정도로 키웠단다"

	para "……음, 포켓몬을 찾아간다면"
	line "요금은 @"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "원일세!"
	done

UnknownText_0x1bde04::
	text "자 여기!"
	line "그럼 포켓몬 데리고가거라"
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER>는(은) 보모로부터"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "찾았다!"
	prompt

UnknownText_0x1bde32::
	text "뭐야, 벌써 왔는가?"
	line "너의 @"
	text_ram wStringBuffer1
	text "는(은)…"

	para "아직 약간"
	line "시간이 걸릴 것 같다"

	para "……그래도 포켓몬을 찾아간다면"
	line "요금은 100원이다"
	done

UnknownText_0x1bdea2::
	text "그 이상은 지닐 수 없단다"
	prompt

UnknownText_0x1bdebc::
	text "돈이 부족한 것 같구만"
	prompt

UnknownText_0x1bded9::
	text "그래, 그렇다면"
	prompt

UnknownText_0x1bdee9::
	text "또 오너라"
	done

UnknownText_0x1bdef6::
	text "아직이란다"
	done

UnknownText_0x1bdf00::
	text "오오! 자넨가"

	para "맡고있던 포켓몬을"
	line "양육하고 있으니까……이런일이!"

	para "포켓몬이 알을"
	line "가지고 있더군!"

	para "어디서 가지고 왔는지 모르겠지만"
	line "너의 포켓몬이 가지고 왔겠지!"
	cont "역시 가지고싶겠지?"
	done

UnknownText_0x1bdfa5::
	text "<PLAYER>는(은) 보모로부터"
	line "알을 건네어 받았다!"
	done

UnknownText_0x1bdfba::
	text "소중히 키우거라"
	done

UnknownText_0x1bdfd1::
	text "그렇다면 내가 받지"
	line "고맙구나"
	done

UnknownText_0x1bdff2::
	text "그 이상은 지니고 갈 수 없단다"
	line "다음 번에 가지고가거라"
	done

UnknownText_0x1be024::
	text "어느 포켓몬을"
	line "촬영할껀가?"
	prompt

UnknownText_0x1be047::
	text "좋아!"
	line "잠시 가만 있거라"
	prompt

UnknownText_0x1be06a::
	text "자! 다 끝났다!"
	line "또 오너라"
	done
