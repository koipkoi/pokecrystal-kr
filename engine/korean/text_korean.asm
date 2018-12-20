; home/text.asm에서 불러옴.
; bc = 고유번호 (b가 0일 경우 영문)
; de = 대사 주소
; hl = 타일 주소 (wram)

Korean::
	push de
	push hl
	push bc
	call CheckTable
	jr nc, .done
	call TrimTable
	call CheckTable
	jr nc, .done
	ld a, $80
.done
	pop bc
	push af
	push bc
	call RenderFont
	pop bc
	pop af
	pop hl
	call SetTile
	pop de
	ret

; 폰트 속성, 테이블 초기화
Korean_Init::
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a
	xor a
	ld [wKoreanFontProperty], a
	ld c, wKoreanTextTableBufferEnd - wKoreanTextTableBuffer
	ld hl, wKoreanTextTableBuffer
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ei
	ret


; 폰트 속성 설정
; 1. 기본 속성
Korean_SetDefaultFont::
	xor a
	jr SetFontProperty

; 2. 반전 설정
Korean_SetInverseFont::
	ld a, FONT_INVERSE
	jr SetFontProperty

; 3. 배경색 설정 (투명색 해제)
Korean_SetFillBGFont::
	ld a, FONT_FILL_BG
	jr SetFontProperty

; 4. 속성 적용
SetFontProperty:
	push bc
	push de
	ld c, a
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a
	ld a, c
	ld [wKoreanFontProperty], a
	pop af
	ldh [rSVBK], a
	ei
	pop de
	pop bc
	ret

; 사용가능한 테이블이 있는지 체크
; 반환값 a = 타일번호, 캐리 시 테이블 정리 필요
CheckTable:
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a
	ld hl, wKoreanTextTableBuffer
.loop
	bit 7, [hl]
	jr z, .found
; 중복 테이블 검사
	ld a, [hli]
	res 7, a
	cp b
	jr nz, .next
	ld a, [hl]
	cp c
	jr z, .same_table
.next
	inc l
	jr nz, .loop
	
; 공간부족
	pop af
	ldh [rSVBK], a
	ei
	scf
	ret

.same_table
	dec l
.found
	pop af
	ldh [rSVBK], a
	ei
	sub a
	ld a, l
	ret

; 테이블 정리
Korean_TrimTable::
	push bc
	push de
	push hl
	call TrimTable
	pop hl
	pop de
	pop bc
	ret

TrimTable:
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a
	ld hl, wKoreanTextTableBuffer
	ld c, wKoreanTextTableBufferEnd - wKoreanTextTableBuffer
.loop1
	res 7, [hl]
	inc hl
	dec c
	jr nz, .loop1
	ld h, HIGH(wKoreanTextTableBuffer)
	ld de, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT + $100
.loop2
	ld a, [de]
	inc de
	cp $7f
	jr c, .pass
	and $fe
	ld l, a
	set 7, [hl]
.pass
	dec c
	jr nz, .loop2
	dec b
	jr nz, .loop2
	pop af
	ldh [rSVBK], a
	ei
	ret

; 폰트 그래픽 출력
RenderFont:
	ld h, HIGH(wKoreanTextTableBuffer)
	ld l, a
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a
	ld a, b
	set 7, a
	ld [hli], a
	ld a, c
	ld [hl], a
	dec hl
	push bc
; get vram addr
	ld b, $8
	ld c, l
rept 4
	sla c
	rl b
endr
	ld d, b
	ld e, c
	pop bc
	push de
; 영문자 검사
	ld a, b
	and a
	jr nz, .korean
	ld a, c
	sub "A"
; b = 0
	ld c, a
rept 3
	sla c
	rl b
endr
	ld hl, Font
	add hl, bc
	ld b, $8
	ld c, BANK(Font)
	jr .render
.korean
; get bank
	push bc
	ld a, b
	and a, $0c
	rrca
	rrca
	add a, BANK(KoreanFont)
	pop bc
	push af
	ld a, b
	and a, 3
	add a, 4
	ld b, a
rept 4
	sla c
	rl b
endr
	ld h, b
	ld l, c
	ld b, $10
	pop af
	ld c, a
.render
; 필요 인자값
; b  : length
; c  : bank
; hl : src
; de : dest
	ld de, wKoreanFontDataBuffer
	call LoadKoreanFont
	call RenderFont_SetProperty
	pop hl
; Copy to VRAM
	ei
	ld a, HIGH(wKoreanFontDataBuffer)
	ldh [rHDMA1], a
	ld a, LOW(wKoreanFontDataBuffer)
	ldh [rHDMA2], a
	ld a, h
	ldh [rHDMA3], a
	ld a, l
	ldh [rHDMA4], a
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .HDMATransfer_LCDDisabled
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .HDMATransfer_LCDEnabled
.WaitForVBlank
	ldh a, [rLY]
	cp a, $8c
	jr nc, .WaitForVBlank
.HDMATransfer_LCDEnabled
	di
	rst WaitForHVBlank
	ld a, $81
	ldh [rHDMA5], a
	ldh a, [rHDMA5]
	and a, $7f
	inc a
.loop
	push af
	call WaitForPlaceHDMA
	pop af
	dec a
	jr nz, .loop
	jr .return
.HDMATransfer_LCDDisabled
	di
	ld a, 1
	ldh [rHDMA5], a
.return
	pop af
	ldh [rSVBK], a
	ei
	ret

; 폰트 속성 적용
RenderFont_SetProperty:
	ld de, wKoreanFontDataBuffer
	ld a, [wKoreanFontProperty]
	and a
	jr z, .return
	sub 1
	jr nz, .fill_bg

; 폰트 반전
	ld b, $20
.inverse
	ld a, [de]
	cpl
	ld [de], a
	inc de
	dec b
	jr nz, .inverse
	jr .return

; 폰트 배경 설정 (투명색 해제)
.fill_bg
	ld b, $10
.loop
	ld a, $ff
	ld [de], a
	inc de
	inc de
	dec b
	jr nz, .loop

.return
	ret

; 타일 적용
SetTile:
	di
	ld c, a
	ld a, b
	and a
	jr nz, .korean
	ld a, c
	jr .return
.korean
	ld a, c
	push hl
	ld bc, -SCREEN_WIDTH
	add hl, bc
	ld [hl], a
	inc a
	pop hl
.return
	ld [hli], a
	ei
	ret
