BattleCommand_Rage:
; rage
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RAGE, [hl]
	ret
