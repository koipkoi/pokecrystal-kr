GBCOnlyScreen:
	ldh a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	ld a, 0 ; this has the same effect as selecting bank 1
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, GBCOnlyTextGFX
	ld hl, vTiles1
	lb bc, BANK(GBCOnlyTextGFX), $40
	call Get2bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop

DrawGBCOnlyScreen:
	call DrawGBCOnlyBorder

	; Pokemon
	hlcoord 3, 2
	ld b, 14
	ld c, 4
	ld a, $8
	call DrawGBCOnlyGraphic

	; Crystal
	hlcoord 5, 6
	ld b, 10
	ld c, 2
	ld a, $40
	call DrawGBCOnlyGraphic

	ld de, GBCOnlyString
	hlcoord 3, 9
	call GBCOnly_PlaceString

	ret

DrawGBCOnlyBorder:
	hlcoord 0, 0
	ld [hl], 0 ; top-left

	inc hl
	ld a, 1 ; top
	call .FillRow

	ld [hl], 2 ; top-right

	hlcoord 0, 1
	ld a, 3 ; left
	call .FillColumn

	hlcoord 19, 1
	ld a, 4 ; right
	call .FillColumn

	hlcoord 0, 17
	ld [hl], 5 ; bottom-left

	inc hl
	ld a, 6 ; bottom
	call .FillRow

	ld [hl], 7 ; bottom-right
	ret

.FillRow:
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret

.FillColumn:
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret

DrawGBCOnlyGraphic:
	ld de, SCREEN_WIDTH
.y
	push bc
	push hl
.x
	ld [hli], a
	inc a
	dec b
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .y
	ret

GBCOnly_PlaceString:
	push hl
.loop
	ld a, [de]
	cp -1
	jr z, .return
	cp "<LF>"
	jr z, .LineFeed
	inc de
	ld [hli], a
	jr .loop
.LineFeed
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	push hl
	inc de
	jr .loop
.return
	pop hl
	ret

GBCOnlyString:
	; "이 카트리지는"
	db $80, $7f, $81, $82, $83, $84, $85, "<LF>"
	db $90, $7f, $91, $92, $93, $94, $95, "<LF>"
	; "게임보이 컬러 전용입니다."
	db $86, $87, $88, $89, $7f, $8a, $8b, $7f, $8c, $8d, $8e, $8f, $a0, $a1, "<LF>"
	db $96, $97, $98, $99, $7f, $9a, $9b, $7f, $9c, $9d, $9e, $9f, $b0, $b1, "<LF>"
	; "게임보이 컬러에서"
	db $a2, $a3, $a4, $a5, $7f, $a6, $a7, $a8, $a9, "<LF>"
	db $b2, $b3, $b4, $b5, $7f, $b6, $b7, $b8, $b9, "<LF>"
	; "시도해주세요."
	db $aa, $ab, $ac, $ad, $ae, $af, $a1, "<LF>"
	db $ba, $bb, $bc, $bd, $be, $bf, $b1, -1

GBCOnlyGFX:
INCBIN "gfx/sgb/gbc_only.2bpp.lz"

GBCOnlyTextGFX:
INCBIN "gfx/sgb/gbc_only_text.2bpp.bin"
