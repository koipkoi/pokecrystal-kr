DrawKrisPackGFX:
	ld hl, PackFGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, vTiles2 tile $50
	lb bc, BANK(PackFGFX), 12
	call Request2bpp
	ret

PackFGFXPointers:
	dw PackFGFX + (12 tiles) * 1 ; ITEM_POCKET
	dw PackFGFX + (12 tiles) * 3 ; BALL_POCKET
	dw PackFGFX + (12 tiles) * 0 ; KEY_ITEM_POCKET
	dw PackFGFX + (12 tiles) * 2 ; TM_HM_POCKET

PackFGFX:
INCBIN "gfx/pack/pack_f.2bpp"
