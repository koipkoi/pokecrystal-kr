; rst vectors

SECTION "rst0", ROM0
	di
	jp Start

SECTION "rst8", ROM0 ; rst FarCall
	jp FarCall_hl

SECTION "rst10", ROM0 ; rst Bankswitch
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18", ROM0 ; rst WaitForHVBlank
rst18_WaitForHVBlank:
	ldh a, [rSTAT]
	and $3
	jr z, rst18_WaitForHVBlank
.loop
	ldh a, [rSTAT]
	and $3
	jr nz, .loop
	ret

; SECTION "rst20", ROM0
; rst20 is midst rst18

SECTION "rst28", ROM0 ; rst JumpTable
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp hl

; SECTION "rst30", ROM0
; rst30 is midst rst28

SECTION "rst38", ROM0
rst38_nop:
	nop
WaitForPlaceHDMA::
	ld a, $39
.loop
	dec a
	jr nz, .loop
	ret
