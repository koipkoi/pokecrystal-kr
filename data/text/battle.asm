BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER>는(은) @"
	text_decimal wPayDayMoney, 3, 6
	text "원"
	line "주웠다!"
	prompt

WildPokemonAppearedText:
	text "앗! 야생의"
	line "@"
	text_ram wEnemyMonNick
	text "(이)가"
	cont "튀어나왔다!"
	prompt

HookedPokemonAttackedText:
	text "낚아올린 @"
	text_ram wEnemyMonNick
	text_start
	line "(이)가 덤벼들었다!"
	prompt

PokemonFellFromTreeText:
	text "흔든 나무로부터"
	line "@"
	text_ram wEnemyMonNick
	text "(이)가"
	cont "떨어졌다!"
	prompt

WildCelebiAppearedText:
	text "앗! 야생의"
	line "@"
	text_ram wEnemyMonNick
	text "(이)가"
	cont "튀어나왔다!"
	prompt

WantsToBattleText::
	text "<ENEMY>(이)가"
	line "승부를 걸어왔다!"
	prompt

BattleText_WildFled:
	text "야생의 @"
	text_ram wEnemyMonNick
	text "는(은)"
	line "도망쳤다!"
	prompt

BattleText_EnemyFled:
	text "적의 @"
	text_ram wEnemyMonNick
	text "는(은)"
	line "도망쳤다!"
	prompt

HurtByPoisonText:
	text "<USER>는(은)"
	line "독의 데미지를 입고 있다!"
	prompt

HurtByBurnText:
	text "<USER>는(은)"
	line "화상의 데미지를 입었다!"
	prompt

LeechSeedSapsText:
	text "기생목이 <USER>의"
	line "체력을 빼앗았다!"
	prompt

HasANightmareText:
	text "<USER>는(은)"
	line "악몽에 시달리고 있다!"
	prompt

HurtByCurseText:
	text "<USER>는(은)"
	line "저주에 걸려있다!"
	prompt

SandstormHitsText:
	text "모래바람이 <USER>를(을)"
	line "습격했다!"
	prompt

PerishCountText:
	text "<USER>의 멸망의"
	line "카운트가 @"
	text_decimal wDeciramBuffer, 1, 1
	text "(으)로 되었다"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "(으)로"
	cont "약간 회복"
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "(으)로 PP회복"
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>는(은) 미래예지의"
	line "공격을 받았다!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>를(을) 감싸고"
	line "있던 신비의 베일이 사라졌다!"
	prompt

BattleText_MonsLightScreenFell:
	text "@"
	text_ram wStringBuffer1
	text "의 빛의 장막의"
	line "효과가 떨어졌다!"
	prompt

BattleText_MonsReflectFaded:
	text "@"
	text_ram wStringBuffer1
	text "의 리플렉터의"
	line "효과가 떨어졌다!"
	prompt

BattleText_RainContinuesToFall:
	text "비가 계속 내리고 있다!"
	prompt

BattleText_TheSunlightIsStrong:
	text "햇살이 강하다"
	prompt

BattleText_TheSandstormRages:
	text "모래바람이 세차게 분다"
	prompt

BattleText_TheRainStopped:
	text "비가 내리다가 그쳤다!"
	prompt

BattleText_TheSunlightFaded:
	text "햇살이 약해졌다!"
	prompt

BattleText_TheSandstormSubsided:
	text "모래바람이 가라앉았다!"
	prompt

BattleText_EnemyMonFainted:
	text "적의 @"
	text_ram wEnemyMonNick
	text "는(은)"
	line "쓰러졌다!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER>는(은) 상금으로"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "원 손에 넣었다!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "와(과)의 승부에서 이겼다!"
	prompt

TiedAgainstText:
	text "<ENEMY>"
	line "와(과)의 승부에서 비겼다!"
	prompt

SentSomeToMomText:
	text "<PLAYER>는(은) 상금으로"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "원 손에 넣었다!"
	cont "어머니에게 약간 송금했다!"
	prompt

SentHalfToMomText:
	text "어머니에게 반 송금했다!"
	prompt

SentAllToMomText:
	text "어머니에게 전부 송금했다!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>『엥?"
	line "너의 포켓몬으로"
	cont "하는 것이 좋았을까?"
	prompt

BattleText_MonFainted:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "쓰러졌다!"
	prompt

BattleText_UseNextMon:
	text "다음 포켓몬을 사용하겠습니까?"
	done

BattleText_0x80a93:
	text "<RIVAL>『됐어!"
	line "좋은 포켓몬을 골랐나보군!"
	prompt

LostAgainstText:
	text "<ENEMY>와(과)의"
	line "승부에서 졌다!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>는(은)"
	line "@"
	text_ram wEnemyMonNick
	text "를(을)"
	cont "꺼내려 하고있다"

	para "<PLAYER>(이)도 포켓몬을"
	line "바꾸겠습니까?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>는(은)"
	line "@"
	text_ram wEnemyMonNick
	text "를(을)"
	cont "차례로 꺼냈다"
	done

BattleText_TheresNoWillToBattle:
	text "싸울 기력이 없다!"
	prompt

BattleText_AnEGGCantBattle:
	text "알은 싸울 수 없다!"
	prompt

BattleText_CantEscape2:
	text "도망칠 수 없다!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "안 되!"
	line "승부도중에"
	cont "상대에게 등을 보일 수 없어!"
	prompt

BattleText_GotAwaySafely:
	text "성공적으로 도망쳤다!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>는(은) 지니고 있던"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "사용하여 도망쳤다"
	prompt

BattleText_CantEscape:
	text "도망칠 수가 없다!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>는(은) 압정"
	line "뿌리기의 데미지를 입었다!"
	prompt

RecoveredUsingText:
	text "<TARGET>는(은) 지니고"
	line "있던 @"
	text_ram wStringBuffer1
	text "(으)로"
	cont "회복했다!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>(이)가 지니고 있던"
	line "@"
	text_ram wStringBuffer1
	text "(이)가"
	cont "작동했다!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "여기서는 도구를"
	line "사용할 수 없습니다"
	prompt

BattleText_MonIsAlreadyOut:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "이미 나가 있습니다"
	prompt

BattleText_MonCantBeRecalled:
	text "@"
	text_ram wBattleMonNick
	text "를(을)"
	line "돌아오게 할 수 없다"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "기술의 남은 포인트가 없다!"
	prompt

BattleText_TheMoveIsDisabled:
	text "기술을 봉인 당해있다!"
	prompt

BattleText_MonHasNoMovesLeft:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "낼 수 있는 기술이 없다!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>의"
	line "앵콜 상태가 풀렸다!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text "@"
	text_ram wStringBuffer1
	text "는(은)"
	line "레벨@"
	text_decimal wCurPartyLevel, 1, 3
	text "(으)로 올랐다!@"
	sound_dex_fanfare_50_79
	db "@@"

BattleText_WildMonIsEating:
	text "야생의@"
	text_ram wEnemyMonNick
	text "는(은)"
	line "먹이를 먹고 있다!"
	prompt

BattleText_WildMonIsAngry:
	text "야생의@"
	text_ram wEnemyMonNick
	text "는(은)"
	line "화가 나있다!"
	prompt

FastAsleepText:
	text "<USER>는(은)"
	line "쿨쿨 자고 있다"
	prompt

WokeUpText:
	text "<USER>는(은)"
	line "눈을 떴다!"
	prompt

FrozenSolidText:
	text "<USER>는(은)"
	line "얼어버려서 움직일 수 없다!"
	prompt

FlinchedText:
	text "<USER>는(은)"
	line "기가 죽었다"
	prompt

MustRechargeText:
	text "공격의 반동으로"
	line "<USER>는(은) 꼼짝못한다"
	prompt

DisabledNoMoreText:
	text "<USER>의"
	line "사슬묶기가 풀렸다!"
	prompt

IsConfusedText:
	text "<USER>는(은)"
	line "혼란에 빠져있다!"
	prompt

HurtItselfText:
	text "영문도 모르고"
	line "자신을 공격했다!"
	prompt

ConfusedNoMoreText:
	text "<USER>는(은)"
	line "혼란이 풀렸다"
	prompt

BecameConfusedText:
	text "<TARGET>는(은)"
	line "혼란해 있다!"
	prompt
; ItemHealedConfusion

BattleText_ItemHealedConfusion: ; ItemHealedConfusion
	text "<TARGET>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "(으)로"
	cont "혼란을 치료했다!"
	prompt

AlreadyConfusedText:
	text "<TARGET>는(은)"
	line "이미 혼란에 빠져있다"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "의"
	cont "데미지를 받고 있다"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "(으)로부터"
	cont "풀려났다!"
	prompt

UsedBindText:
	text "<TARGET>는(은) <USER>"
	line "에게 조이기를 당했다!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>는(은) 소용돌이"
	line "안에 감금되었다!"
	prompt

FireSpinTrapText:
	text "<TARGET>는(은) 소용돌이"
	line "안에 감금되었다!"
	prompt

WrappedByText:
	text "<TARGET>는(은) <USER>"
	line "에게 꽁꽁 감겨졌다!"
	prompt

ClampedByText:
	text "<TARGET>는(은) <USER>"
	line "의 껍데기에 꼈다"
	prompt

StoringEnergyText:
	text "<USER>는(은)"
	line "꼼짝않고 있다"
	prompt

UnleashedEnergyText:
	text "<USER>의"
	line "참기가 풀렸다"
	prompt

HungOnText:
	text "<TARGET>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "에서 견뎌냈다!"
	prompt

EnduredText:
	text "<TARGET>는(은) "
	line "공격을 참았다!"
	prompt

InLoveWithText:
	text "<USER>는(은)"
	line "<TARGET>에게 헤롱헤롱!"
	prompt

InfatuationText:
	text "<USER>는(은) 헤롱헤롱"
	line "해서 기술을 펼칠 수 없었다!"
	prompt

DisabledMoveText:
	text "<USER>는(은) 사슬묶기"
	line "때문에 @"
	text_ram wStringBuffer1
	text "를(을)"
	cont "낼 수 없다!"
	prompt

LoafingAroundText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "게으름을 피우고 있다"
	prompt

BeganToNapText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "낮잠자기 시작했다!"
	prompt

WontObeyText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "말을 듣지 않는다!"
	prompt

TurnedAwayText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "외면했다"
	prompt

IgnoredOrdersText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "모르는 채했다"
	prompt

IgnoredSleepingText:
	text "@"
	text_ram wBattleMonNick
	text "는(은)"
	line "잠든 채로"
	cont "명령을 무시했다"
	prompt

NoPPLeftText:
	text "그러나 기술 포인트가"
	line "없었다!"
	prompt

HasNoPPLeftText:
	text "<USER>는(은) 포인트가떨어져서"
	line "@"
	text_ram wStringBuffer2
	text "를(을)"
	cont "낼 수 없다!"
	prompt

WentToSleepText:
	text "<USER>는(은)"
	line "잠들기 시작했다!"
	done

RestedText:
	text "<USER>는(은)"
	line "건강해져서 잠자기 시작했다!"
	done

RegainedHealthText:
	text "<USER>는(은) 체력을"
	line "회복했다!"
	prompt

AttackMissedText:
	text "그러나 <USER>의"
	line "공격은 빗나갔다!"
	prompt

AttackMissed2Text:
	text "<USER>의"
	line "공격은 빗나갔다!"
	prompt

CrashedText:
	text "떠올랐다가 한계를 넘어"
	line "<USER>는(은)"
	cont "지면에 부딪쳤다!"
	prompt

UnaffectedText:
	text "<TARGET>에게는"
	line "전혀 효과가 없다!"
	prompt

DoesntAffectText:
	text "<TARGET>에게는"
	line "효과가 없는 듯 하다……"
	prompt

CriticalHitText:
	text "급소에 맞았다!"
	prompt

OneHitKOText:
	text "일격필살!"
	prompt

SuperEffectiveText:
	text "효과는 뛰어났다!"
	prompt

NotVeryEffectiveText:
	text "효과는 조금 부족한 듯 하다"
	prompt

TookDownWithItText:
	text "<TARGET>는(은)"
	line "<USER>를(을)"
	cont "길동무로 삼았다!"
	prompt

RageBuildingText:
	text "<USER>의 분노의"
	line "볼티지가 올라간다!"
	prompt

GotAnEncoreText:
	text "<TARGET>는(은)"
	line "앵콜을 당했다!"
	prompt

SharedPainText:
	text "서로 체력을"
	line "나누어 가졌다!"
	prompt

TookAimText:
	text "<USER>는(은) <TARGET>"
	line "에 목표를 정했다!"
	prompt

SketchedText:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "스케치했다!"
	prompt

DestinyBondEffectText:
	text "<USER>는(은) 상대를"
	line "길동무로 삼으려하고 있다"
	prompt

SpiteEffectText:
	text "<TARGET>의"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "@"
	text_decimal wd265, 1, 1
	text " 깎았다!"
	prompt

BellChimedText:
	text "방울소리가 울려왔다!"
	; line ""
	line ""
	prompt

FellAsleepText:
	text "<TARGET>는(은)"
	line "잠들어버렸다!"
	prompt

AlreadyAsleepText:
	text "<TARGET>는(은) 이미"
	line "잠자고 있다!"
	prompt

WasPoisonedText:
	text "<TARGET>는(은)"
	line "독을 뒤집어썼다"
	prompt

BadlyPoisonedText:
	text "<TARGET>는(은)"
	line "벌써 독을 뒤집어썼다!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>는(은) 이미"
	line "독을 뒤집어쓰고 있다"
	prompt

SuckedHealthText:
	text "<TARGET>(으)로부터"
	line "체력을 흡수했다!"
	prompt

DreamEatenText:
	text "<TARGET>의"
	line "꿈을 먹었다!"
	prompt

WasBurnedText:
	text "<TARGET>는(은)"
	line "화상을 입었다!"
	prompt

DefrostedOpponentText:
	text "<TARGET>의"
	line "얼음이 녹았다!"
	prompt

WasFrozenText:
	text "<TARGET>는(은)"
	line "꽁꽁 얼어버렸다!"
	prompt

WontRiseAnymoreText:
	text "<USER>의"
	line "@"
	text_ram wStringBuffer2
	text "는(은)"
	cont "더 이상 오르지않는다"
	prompt

WontDropAnymoreText:
	text "<TARGET>의"
	line "@"
	text_ram wStringBuffer2
	text "는(은)"
	cont "더이상 내려가지않는다!"
	prompt

FledFromBattleText::
	text "<USER>는(은) 전투에서"
	line "이탈했다!"
	prompt

FledInFearText:
	text "<TARGET>는(은) 두려워져서"
	line "도망쳤다!"
	prompt

BlownAwayText:
	text "<TARGET>는(은)"
	line "내동댕이쳐졌다!"
	prompt

PlayerHitTimesText:
	text "@"
	text_decimal wPlayerDamageTaken, 1, 1
	text "회 맞았다!"
	prompt

EnemyHitTimesText:
	text "@"
	text_decimal wEnemyDamageTaken, 1, 1
	text "회 맞았다!"
	prompt

MistText:
	text "<USER>는(은)"
	line "흰안개에 둘러싸였다!"
	prompt

ProtectedByMistText:
	text "<TARGET>는(은) 흰안개에"
	line "지켜지고 있다"
	prompt

GettingPumpedText:
	interpret_data
	text "<USER>는(은)"
	line "힘이 넘치고 있다"
	prompt

RecoilText:
	text "<USER>는(은) 공격의"
	line "반동을 입었다!"
	prompt

MadeSubstituteText:
	text "<USER>의"
	line "분신이 나타났다"
	prompt

HasSubstituteText:
	text "그러나 <USER>의"
	line "대타출동은 이미 나와있다!"
	prompt

TooWeakSubText:
	text "그러나 분신을 불러내기에는"
	line "체력이 부족했다!"
	prompt

SubTookDamageText:
	text "<TARGET>를(을) 대신해서"
	line "분신이 공격을 받았다!"
	prompt

SubFadedText:
	text "<TARGET>의 분신은"
	line "사라져버렸다……"
	prompt

LearnedMoveText:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "를(을) 배웠다"
	prompt

WasSeededText:
	text "<TARGET>에게"
	line "씨를 심었다!"
	prompt

EvadedText:
	text "<TARGET>는(은)"
	line "공격을 피했다!"
	prompt

WasDisabledText:
	text "<TARGET>의"
	line "@"
	text_ram wStringBuffer1
	text "를(을)"
	cont "봉해버렸다!"
	prompt

CoinsScatteredText:
	text "금화가 주변에 산산히 흩어졌다!"
	prompt

TransformedTypeText:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "타입이 되었다!"
	prompt

EliminatedStatsText:
	text "모든 스테이터스가"
	line "원래대로 되돌아왔다!"
	prompt

TransformedText:
	text "<USER>는(은)"
	line "@"
	text_ram wStringBuffer1
	text "(으)로"
	cont "변신했다!"
	prompt

LightScreenEffectText:
	text "<USER>는(은) 빛의 장막"
	line "으로 특정 공격에 강하게되었다!"
	prompt

ReflectEffectText:
	text "<USER>는(은) 리플렉터로"
	line "타격공격에 강하게되었다!"
	prompt

NothingHappenedText:
	text "그러나 아무것도 일어나지 않는다!"
	prompt

ButItFailedText:
	text "그러나 기술이 잘 먹히지 않았다!"
	prompt

ItFailedText:
	text "기술이 잘 먹히지 않았다!"
	prompt

DidntAffect1Text:
	text "그러나 <TARGET>에는"
	line "듣지 않았다!"
	prompt

DidntAffect2Text:
	text "<TARGET>에는"
	line "듣지 않았다!"
	prompt

HPIsFullText:
	text "그러나 <USER>의"
	line "체력은 가득이다!"
	prompt

DraggedOutText:
	text "<USER>(이)가 전투에"
	line "억지로 끌어내어졌다!"
	prompt

ParalyzedText:
	text "<TARGET>는(은) 마비되어서"
	line "기술을 펼치기 힘들게되었다!"
	prompt

FullyParalyzedText:
	text "<USER>는(은)"
	line "몸이 감전되어 움직일 수 없다!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>는(은) 이미"
	line "마비되어있다"
	prompt

ProtectedByText:
	text "<TARGET>는(은) "
	line "@"
	text_ram wStringBuffer1
	text "(으)로"
	cont "지켜지고 있다!"
	prompt

MirrorMoveFailedText:
	text "그러나 따라하기는"
	next "실패로 끝났다!"
	prompt

StoleText:
	text "<USER>는(은) <TARGET>"
	line "(으)로부터 @"
	text_ram wStringBuffer1
	; text ""
	text ""
	cont "를(을) 빼았았다!"
	prompt

CantEscapeNowText:
	text "<TARGET>는(은)"
	line "도망칠 수 없다!"
	prompt

StartedNightmareText:
	text "<TARGET>는(은)"
	line "악몽을 꾸기 시작했다!"
	prompt

WasDefrostedText:
	text "<USER>의"
	line "얼음이 녹았다!"
	prompt

PutACurseText:
	text "<USER>는(은)"
	line "자신의 체력을 깎아먹고"

	para "<TARGET>에게"
	line "저주를 걸었다!"
	prompt

ProtectedItselfText:
	text "<USER>는(은)"
	line "방어태세에 들어갔다!"
	prompt

ProtectingItselfText:
	text "그러나 <TARGET>"
	line "는(은) 방어하고 있다!"
	done

SpikesText:
	text "<TARGET>의 발밑에"
	line "압정 뿌리기가 펼쳐졌다!"
	prompt

IdentifiedText:
	text "<USER>는(은) <TARGET>"
	line "의 정체를 간파했다!"
	prompt

StartPerishText:
	text "서로의 포켓몬은"
	line "3턴후에 끝나버린다!"
	prompt

SandstormBrewedText:
	text "모래바람이 불기 시작했다!"
	prompt

BracedItselfText:
	text "<USER>는(은) 견디기"
	line "태세에 들어갔다!"
	prompt

FellInLoveText:
	text "<TARGET>는(은)"
	line "해롱해롱해졌다!"
	prompt

CoveredByVeilText:
	text "<USER>는(은)"
	line "신비의 베일에 감싸였다!"
	prompt

SafeguardProtectText:
	text "<TARGET>는(은)"
	line "신비의 베일에의해 지켜지고 있다!"
	prompt

MagnitudeText:
	text "매그니튜드@"
	text_decimal wd265, 1, 1
	; text "!!"
	text $0B, $66, $0B, $66
	prompt

ReleasedByText:
	text "<USER>는(은) <TARGET>"
	line "의 공격으로부터 풀려났다!"
	prompt

ShedLeechSeedText:
	text "<USER>는(은)"
	line "씨뿌리기 기술을 날렸다!"
	prompt

BlewSpikesText:
	text "<USER>는(은)압정 뿌리기"
	line "를 펼쳤다!"
	prompt

DownpourText:
	text "큰 비가 되었다!"
	prompt

SunGotBrightText:
	text "햇살이 강해졌다!"
	prompt

BellyDrumText:
	text "<USER>는(은) 체력을"
	line "깎아먹고 풀파워가 되었다!"
	prompt

CopiedStatsText:
	text "<USER>는(은) <TARGET>"
	line "의 보조효과를 복사했다!"
	prompt

ForesawAttackText:
	text "<USER>는(은) 앞으로의"
	line "공격을 예지했다!"
	prompt

BeatUpAttackText:
	text "@"
	text_ram wStringBuffer1
	text "의 공격!"
	done

RefusedGiftText:
	text "<TARGET>는(은) 프레젠트"
	line "를 받지 않았다!"
	prompt

IgnoredOrders2Text:
	text "<USER>는(은)"
	line "명령을 무시했다!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "통신 에러로 인하여 대전이"
	line "중단되었습니다!"
	prompt
