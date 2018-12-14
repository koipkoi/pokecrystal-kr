; 모든 코드 분석 필요함

KoreanIndexes:
incbin "data/korean/korean_indexes.bin"

NamingScreenGFX_Korean_Tiles::
incbin "data/korean/naming_screen_korean_tiles.2bpp.bin"

NamingScreen_Korean_CheckEndOfString::
	call GetTextPosition
	dec hl
	ld a, [hld]
	ld b, [hl]
	ld c, a
	cp a, $ff
	jr nz, .no_empty
	ld a, b
	cp a, $b
	jr nz, .no_empty
	scf
	ret

.no_empty
	sla c
	rl b
	ld hl, KoreanIndexes
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	and b
	cp a, $ff
	jr nz, .having_table
	and a
	ret
	
.having_table
	ld a, b
	and a, $7c
	ret z
	cp a, $4
	ret z
	cp a, $10
	ret z
	cp a, $20
	ret z
	cp a, $44
	ret z
	scf
	ret


call_5c36::
	ld a, [wNamingScreenLastCharacter]
	cp a, $7f
	jr nz, .check_question
	ld bc, $0bff ; '　'
	ret

.check_question
	cp a, $e6
	jr nz, .check_exclamation
	ld bc, $0b67 ; '？'
	ret

.check_exclamation
	cp a, $e7
	jr nz, .check_numeric
	ld bc, $0b66 ; '！'
	ret

.check_numeric
	cp a, $f6
	jr c, .check_korean_jamo
	sub a, $6
	ld c, a
	ld b, $b ; '０' ~ '９'
	ret

.check_korean_jamo
	ld a, [wNamingScreenCurNameLength]
	and a
	jr nz, .return_before_make_korean
	ld a, [wNamingScreenLastCharacter]
	sub a, $a0
	ld c, a
	ld b, $b
	ret

.return_before_make_korean
	add sp, -6
	ld hl, .return
	push hl
	jr .make_korean

.return
	add sp, $6
	ret

.make_korean
	ld a, [wNamingScreenLastCharacter]
	sub a, $a0
	ld c, a
	ld b, $b
	ld hl, sp + $2
	ld [hli], a
	ld [hl], b
	
	; hl = KoreanIndexes + bc * 2;
	sla c
	rl b
	ld hl, KoreanIndexes
	add hl, bc
	
	; *((u16)hl + 2) = *((u16)hl);
	ld a, [hli]
	ld b, [hl]
	ld hl, sp + $4
	ld [hli], a
	ld [hl], b
	
	; 모음
	ld a, [wNamingScreenLastCharacter]
	cp a, $c0
	rl a
	and a, $1
	ld hl, sp + $6
	ld [hl], a
	
	; bc = *((u16)wNamingScreenCurNameLength + 현재 위치값);
	ld hl, wNamingScreenCurNameLength
	dec [hl]
	dec [hl]
	call GetTextPosition
	ld a, [hli]
	ld c, [hl]
	ld b, a
	
	; bc = *((u16)KoreanIndexes + bc * 2)
	sla c
	rl b
	ld hl, KoreanIndexes
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	
	; if (bc == 0xffff)
	;     goto .jr_5cc1
	and b
	cp a, $ff
	jr nz, .jr_5cc1

.jr_5cb6
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	inc [hl]
	ld hl, sp + $2
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

.jr_5cc1
	ld a, b
	and a, $7f
	jr nz, .jr_5cde
	ld a, c
	and a, $e0
	jr nz, .jr_5cde
	ld hl, sp + $6
	bit 0, [hl]
	jr z, .jr_5cd3
	jr .jr_5cb6

.jr_5cd3
	ld hl, sp + $4
	ld a, [hli]
	or c
	ld c, a
	ld a, [hl]
	or b
	ld b, a
	jp jp_5e21

.jr_5cde
	ld a, b
	and a, $7c
	jr nz, .jr_5cea
	ld a, c
	and a, $1f
	jr nz, .jr_5cea
	jr .jr_5cb6

.jr_5cea
	ld a, b
	and a, $7c
	jr nz, .jr_5d0e
	ld hl, sp + $6
	bit 0, [hl]
	jr z, .jr_5d0c
	ld hl, sp + $2
	ld a, [hl]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, data_5e4f
	add hl, de
	ld a, [hli]
	or c
	ld c, a
	ld a, [hl]
	or b
	ld b, a
	jp jp_5e21

.jr_5d0c
	jr .jr_5cb6

.jr_5d0e
	ld hl, sp + $6
	bit 0, [hl]
	jp z, .jr_5dc8
	ld hl, sp + $4
	ld a, [hl]
	and a, $1f
	ld e, a
	ld a, b
	and a, $7c
	cp a, $4
	jr nz, .jr_5d31
	ld a, e
	cp a, $a
	jp nz, .jr_5cb6
	ld a, b
	and a, $3
	or a, $c
	ld b, a
	jp jp_5e21

.jr_5d31
	cp a, $10
	jr nz, .jr_5d51
	ld a, e
	cp a, $d
	jr nz, .jr_5d43
	ld a, b
	and a, $3
	or a, $14
	ld b, a
	jp jp_5e21

.jr_5d43
	cp a, $13
	jp nz, .jr_5cb6
	ld a, b
	and a, $3
	or a, $18
	ld b, a
	jp jp_5e21

.jr_5d51
	cp a, $20
	jr nz, .jr_5db2
	ld a, e
	cp a, $1
	jr nz, .jr_5d63
	ld a, b
	and a, $3
	or a, $24
	ld b, a
	jp jp_5e21

.jr_5d63
	cp a, $7
	jr nz, .jr_5d70
	ld a, b
	and a, $3
	or a, $28
	ld b, a
	jp jp_5e21

.jr_5d70
	cp a, $8
	jr nz, .jr_5d7d
	ld a, b
	and a, $3
	or a, $2c
	ld b, a
	jp jp_5e21

.jr_5d7d
	cp a, $a
	jr nz, .jr_5d8a
	ld a, b
	and a, $3
	or a, $30
	ld b, a
	jp jp_5e21

.jr_5d8a
	cp a, $11
	jr nz, .jr_5d97
	ld a, b
	and a, $3
	or a, $34
	ld b, a
	jp jp_5e21

.jr_5d97
	cp a, $12
	jr nz, .jr_5da4
	ld a, b
	and a, $3
	or a, $38
	ld b, a
	jp jp_5e21

.jr_5da4
	cp a, $13
	jp nz, .jr_5cb6
	ld a, b
	and a, $3
	or a, $3c
	ld b, a
	jp jp_5e21

.jr_5db2
	cp a, $44
	jr nz, .jr_5dc5
	ld a, e
	cp a, $a
	jp nz, .jr_5cb6
	ld a, b
	and a, $3
	or a, $48
	ld b, a
	jp jp_5e21

.jr_5dc5
	jp .jr_5cb6

.jr_5dc8
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	inc [hl]
	ld a, [wNamingScreenMaxNameLength]
	ld e, a
	ld a, [wNamingScreenCurNameLength]
	cp e
	ret nc
	ld hl, wNamingScreenCurNameLength
	dec [hl]
	dec [hl]
	ld a, b
	and a, $7c
	ld e, a
	ld d, $0
	srl e
	rr d
	srl e
	rr d
	push bc
	ld hl, data_5e91
	add hl, de
	ld c, [hl]
	ld hl, sp + $6
	ld a, [hli]
	and a, $e0
	or c
	ld c, a
	ld b, [hl]
	push de
	call call_5e28
	pop de
	pop hl
	jp nc, .jr_5cb6
	push bc
	ld c, l
	ld b, h
	ld hl, data_5e75
	add hl, de
	ld a, b
	and a, $3
	or [hl]
	ld b, a
	call call_5e28
	pop hl
	jp nc, .jr_5cb6
	push hl
	call GetTextPosition
	ld a, b
	ld [hli], a
	ld [hl], c
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	inc [hl]
	pop bc
	ret

jp_5e21:
	call call_5e28
	jp nc, call_5c36.jr_5cb6
	ret

call_5e28:
	ld hl, $4200
	ld d, $a
.jr_5e2d
	ld e, $0
.jr_5e2f
	ld a, [hl]	
	cp c
	jr nz, .jr_5e45
	inc hl
	ld a, [hli]
	cp b
	jr nz, .jr_5e47
	ld de, $c000
	add hl, de
	srl h
	rr l
	dec hl
	ld c, l
	ld b, h
	scf
	ret

.jr_5e45
	inc hl
	inc hl

.jr_5e47
	dec e
	jr nz, .jr_5e2f
	dec d
	jr nz, .jr_5e2d
	and a
	ret


data_5e4f:
	db $00, $04
	db $00, $10
	db $00, $1c
	db $00, $20
	db $00, $40
	db $00, $44
	db $00, $4c
	db $00, $54
	db $00, $58
	db $00, $5c
	db $00, $60
	db $00, $64
	db $00, $68
	db $00, $6c
	db $00, $08
	db $00, $7c
	db $00, $7c
	db $00, $50
	db $00, $7c


data_5e75:
	db $00, $00
	db $00, $04
	db $00, $10
	db $10, $00
	db $00, $20
	db $20, $20
	db $20, $20
	db $20, $20
	db $00, $00
	db $44, $00
	db $00, $00
	db $00, $00
	db $00, $00
	db $00, $00


data_5e91:
	db $00, $01, $02, $0a, $03, $0d, $13, $04, $06, $01, $07, $08, $0a, $11, $12, $13, $07, $08, $0a, $0a, $0b, $0c, $0d, $0f, $10, $11, $12, $13


GetTextPosition:
	push af
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wNamingScreenCurNameLength]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ret


call_5ebd::
	ld hl, wNamingScreenCurNameLength
	dec [hl]
	dec [hl]
	call GetTextPosition
	ld a, [hli]
	ld c, [hl]
	ld b, a
	sla c
	rl b
	ld hl, $4000
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	and b
	cp a, $ff
	jr nz, .jr_5eef

.jr_5ed8
	call GetTextPosition
	ld [hl], $b
	inc hl
	ld [hl], $3e
	inc hl
	ld a, [hli]
	cp a, $b
	ret nz
	ld a, [hld]
	cp a, $3e
	ret nz
	ld [hl], $b
	inc hl
	ld [hl], $3f
	ret

.jr_5eef
	ld a, b
	and a, $7c
	jr z, .jr_5f06
	ld hl, data_5f93
	srl a
	srl a
	ld e, a
	ld d, $0
	add hl, de
	ld a, b
	and a, $3
	or [hl]
	ld b, a
	jr .jr_5f61

.jr_5f06
	ld a, b
	and a, $3
	jr nz, .jr_5f10
	ld a, c
	and a, $e0
	jr z, .jr_5ed8

.jr_5f10
	call GetTextPosition
	ld [hl], $b
	inc hl
	ld [hl], $3e
	inc hl
	ld a, [hli]
	cp a, $b
	jr nz, .jr_5f28
	ld a, [hld]
	cp a, $3e
	jr nz, .jr_5f28
	ld [hl], $b
	inc hl
	ld [hl],$3f

.jr_5f28
	ld b, $0
	ld a, c
	and a, $1f
	ret z
	ld c, a
	ld hl, data_5faf
	add hl, bc
	ld a, [hl]
	ld [wNamingScreenLastCharacter], a
	call call_5c36
	ld a, [wNamingScreenMaxNameLength]
	ld e, a
	ld a, [wNamingScreenCurNameLength]
	cp e
	ret nc
	call GetTextPosition
	ld a, b
	ld [hli], a
	ld [hl], c
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	inc [hl]
	call GetTextPosition
	ld a, [hl]
	cp a, $50
	jr z, .jr_5f5d
	ld [hl], $b
	inc hl
	ld [hl], $3e
	and a
	ret

.jr_5f5d
	call NamingScreen_Korean_CheckEndOfString
	ret

.jr_5f61
	ld hl, $4200
	ld d, $b
.jr_5f66
	ld e, $0
.jr_5f68
	ld a, [hl]
	cp c
	jr nz, .jr_5f88
	inc hl
	ld a, [hli]
	cp b
	jr nz, .jr_5f8a
	ld de, $c000
	add hl, de
	srl h
	rr l
	dec hl
	ld c, l
	ld b, h
	call GetTextPosition
	ld a, b
	ld [hli], a
	ld [hl], c
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	inc [hl]
	ret

.jr_5f88
	inc hl
	inc hl
.jr_5f8a
	dec e
	jr nz, .jr_5f68
	dec d
	jr nz, .jr_5f66
	jp .jr_5ed8


data_5f93:
	db $00, $00
	db $00, $04
	db $00, $10
	db $10, $00
	db $00, $20
	db $20, $20
	db $20, $20
	db $20, $20
	db $00, $00
	db $44, $00
	db $00, $00
	db $00, $00
	db $00, $00
	db $00, $00

data_5faf:
	db $7f, $a0, $ae, $a1, $a2, $af, $a3, $a4, $a5, $b0, $a6, $b1, $a7, $a8, $b2, $a9, $aa, $ab, $ac, $ad, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
