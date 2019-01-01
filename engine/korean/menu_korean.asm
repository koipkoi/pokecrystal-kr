; 메뉴 한글 폰트 백업
Korean_BackupMenuFont::
	; switch bank
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a

	; 백업 시작전 @ 입력 (다른 메뉴 데이터 구분자)
	call GetMenuBackupStackPointer
	ld a, "@"
	ld [hli], a
	ld [hli], a
	ld [hli], a
	call SetMenuBackupStackPointer

	ld hl, wTileMap
	ld bc, wTileMapEnd - wTileMap + $101
.loop
	push hl
	push bc
	call BackupMenuTiles
	pop bc
	pop hl
	inc hl
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	; restore bank
	pop af
	ldh [rSVBK], a
	ei
	ret

BackupMenuTiles:
	; 타일 검사
	ld a, [hl]
	cp $80
	jr c, .return
	and $fe
	cp $ec
	jr nc, .return

	; 고유번호 가져오기 (bc)
	push af
	ld h, HIGH(wKoreanTextTableBuffer)
	ld l, a
	ld a, [hli]
	res 7, a
	ld b, a
	ld a, [hl]
	ld c, a

	; 백업 스택 포인터 가져오기
	call GetMenuBackupStackPointer

	; 타일번호 중복 검사, 중복시 저장 안 함
	pop af
	ld d, a
.loop
	ld a, [hl]
	cp "@"
	jr z, .break

	; 중복 시 백업안 함
	cp d
	jr z, .return

	dec hl
	dec hl
	dec hl
	jr .loop
	
.break
	; 스택 포인터 다시 가져오기
	call GetMenuBackupStackPointer

	; 타일번호, 고유번호 순으로 백업
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a

	; 백업 스택 포인터 업데이트
	call SetMenuBackupStackPointer

.return
	ret

; 메뉴에서 백업된 폰트 복구
Korean_RestoreMenuFont::
	di
	ldh a, [rSVBK]
	push af
	ld a, BANK(wKoreanTextTableBuffer)
	ldh [rSVBK], a

	call GetMenuBackupStackPointer
.loop
	dec hl
	; @가 나오기 전까지 복구 진행
	ld a, [hl]
	cp "@"
	jr z, .break

	; bc = 고유번호
	ld c, a
	dec hl
	ld a, [hl]
	ld b, a

	; a = 타일번호
	dec hl
	ld a, [hl]

	; 폰트 복구
	push hl
	call RenderFont
	pop hl

	; clear
	push hl
	xor a
	ld [hl], a
	inc hl
	ld [hl], a
	inc hl
	ld [hl], a
	inc hl
	pop hl

	; 백업 스택 포인터 업데이트
	call SetMenuBackupStackPointer

	di
	jr .loop

.break
	; 구분자 제거 후 스택 업데이트
	xor a
	ld [hl], a
	dec hl
	ld [hl], a
	dec hl
	ld [hl], a
	call SetMenuBackupStackPointer

	pop af
	ldh [rSVBK], a
	ei
	ret

; 백업 스택 포인터 가져오기 (hl)
GetMenuBackupStackPointer:
	push de
	ld de, wKoreanMenuBackupStackPointer
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	pop de
	ret

; 백업 스택 포인터 업데이트
SetMenuBackupStackPointer:
	push de
	ld de, wKoreanMenuBackupStackPointer
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop de
	ret
