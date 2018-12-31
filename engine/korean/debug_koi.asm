if DEF(_DEBUG)

KoiDebugMenu::
	playsound SFX_THROW_BALL
	earthquake 5

	opentext
	writetext Text_PleaseSelection

	loadmenu Menu_DebugMain
	verticalmenu
	closewindow
	ifequal 1, .GetItem
	ifequal 2, .GetPokemon
	ifequal 3, .MoveMap
	ifequal 4, .LaptopPC

.CloseMenu:
	closetext
	playsound SFX_SHUT_DOWN_PC
	end

.GetPokemon:
	writetext Text_SelectPokemon
	callasm ASM_GetPokemon
	callasm ASM_Getmon
	jump .CloseMenu

.GetItem:
	writetext Text_SelectItem
	callasm ASM_GetItemMenu
	callasm ASM_GetItem
	jump .CloseMenu

.MoveMap:
	writetext Text_Where
	callasm ASM_WarpMenu
	callasm ASM_Warp
	jump .CloseMenu

.LaptopPC:
	jumpstd pcscript


; asm ======================================================
; GetPokemon - Menu
ASM_GetPokemon:
	ld a, 1
	ld [wBuffer1], a ; 출력 초기값 (번호)
	ld a, 5
	ld [wBuffer2], a ; 출력 초기값 (레벨)
	xor a
	ld [wBuffer3], a ; 커서 초기 위치값

	call .DrawMenu
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

.loop
	call .JoypadLoop
	jr c, .return
	ld c, 5
	call DelayFrames
	jr .loop
.return
	ret

.JoypadLoop:
	ldh a, [hJoypadDown]
	and A_BUTTON
	jr nz, .a
	ldh a, [hJoypadDown]
	and D_UP
	jr nz, .up
	ldh a, [hJoypadDown]
	and D_DOWN
	jr nz, .down
	ldh a, [hJoypadDown]
	and D_LEFT
	jr nz, .left
	ldh a, [hJoypadDown]
	and D_RIGHT
	jr nz, .right
	ret

.a
	scf
	ret

.up
	ld a, [wBuffer3]
	and a
	jr z, .up_buffer1
	ld hl, wBuffer2
	inc [hl]
	jr .DrawMenu
.up_buffer1
	ld hl, wBuffer1
	inc [hl]
	jr .DrawMenu

.down
	ld a, [wBuffer3]
	and a
	jr z, .down_buffer1
	ld hl, wBuffer2
	dec [hl]
	jr .DrawMenu
.down_buffer1
	ld hl, wBuffer1
	dec [hl]
	jr .DrawMenu

.left
	xor a
	ld [wBuffer3], a
	jr .DrawMenu

.right
	ld a, 1
	ld [wBuffer3], a
	jr .DrawMenu

.DrawMenu:
	; 박스 표시
	hlcoord 0, 7
	lb bc, 2, 14
	call TextBox

	ld a, [wBuffer3]
	and a
	jr nz, .buffer2
	hlcoord 5, 7
	ld [hl], $61
	hlcoord 5, 10
	ld [hl], $ee
	jr .end_cursor
.buffer2
	hlcoord 13, 7
	ld [hl], $61
	hlcoord 13, 10
	ld [hl], $ee
.end_cursor

	; 출력값 표시 (번호)
	hlcoord 1, 9
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum

	; 포켓몬 이름 표시
	ld a, [wBuffer1]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	hlcoord 5, 9
	ld de, wStringBuffer1
	call PlaceString

	; 출력값 표시 (레벨)
	hlcoord 12, 9
	ld de, wBuffer2
	lb bc, 1, 3
	call PrintNum

	call SafeUpdateSprites

	and a
	ret


; GetPokemon
ASM_Getmon:
	ld a, [wBuffer1]
	ld [wCurPartySpecies], a
	ld a, [wBuffer2]
	ld [wCurPartyLevel], a
	xor a
	ld [wCurItem], a
	ld hl, .debugmon
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld de, wStringBuffer1
	farcall GivePoke
	ret

.debugmon
	db "DebugMon@"

; GetItem - Menu
ASM_GetItemMenu:
	ld a, 0
	ld [wBuffer1], a ; 출력 초기값 (번호)
	ld a, 1
	ld [wBuffer2], a ; 출력 초기값 (개수)
	xor a
	ld [wBuffer3], a ; 커서 초기 위치값

	call .DrawMenu
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

.loop
	call .JoypadLoop
	jr c, .return
	ld c, 5
	call DelayFrames
	jr .loop
.return
	ret

.JoypadLoop:
	ldh a, [hJoypadDown]
	and A_BUTTON
	jr nz, .a
	ldh a, [hJoypadDown]
	and D_UP
	jr nz, .up
	ldh a, [hJoypadDown]
	and D_DOWN
	jr nz, .down
	ldh a, [hJoypadDown]
	and D_LEFT
	jr nz, .left
	ldh a, [hJoypadDown]
	and D_RIGHT
	jr nz, .right
	ret

.a
	scf
	ret

.up
	ld a, [wBuffer3]
	and a
	jr z, .up_buffer1
	ld hl, wBuffer2
	inc [hl]
	jr .DrawMenu
.up_buffer1
	ld hl, wBuffer1
	inc [hl]
	jr .DrawMenu

.down
	ld a, [wBuffer3]
	and a
	jr z, .down_buffer1
	ld hl, wBuffer2
	dec [hl]
	jr .DrawMenu
.down_buffer1
	ld hl, wBuffer1
	dec [hl]
	jr .DrawMenu

.left
	xor a
	ld [wBuffer3], a
	jr .DrawMenu

.right
	ld a, 1
	ld [wBuffer3], a
	jr .DrawMenu

.DrawMenu:
	; 박스 표시
	hlcoord 0, 7
	lb bc, 2, 18
	call TextBox

	ld a, [wBuffer3]
	and a
	jr nz, .buffer2
	hlcoord 5, 7
	ld [hl], $61
	hlcoord 5, 10
	ld [hl], $ee
	jr .end_cursor
.buffer2
	hlcoord 16, 7
	ld [hl], $61
	hlcoord 16, 10
	ld [hl], $ee
.end_cursor

	; 출력값 표시 (번호)
	hlcoord 1, 9
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum
	; 아이템명 표시
	ld a, [wBuffer1]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	hlcoord 5, 9
	ld de, wStringBuffer1
	call PlaceString
	; 출력값 표시 (개수)
	hlcoord 15, 9
	ld de, wBuffer2
	lb bc, 1, 3
	call PrintNum

	call SafeUpdateSprites

	and a
	ret

; GetItem
ASM_GetItem:
	ld a, [wBuffer1]
	ld [wCurItem], a
	ld a, [wBuffer2]
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ret

; Warp - Menu
ASM_WarpMenu:
	ld a, 1
	ld [wBuffer1], a ; 출력 초기값 (뱅크)
	ld a, 1
	ld [wBuffer2], a ; 출력 초기값 (번호)
	xor a
	ld [wBuffer3], a ; 커서 초기 위치값

	call .DrawMenu
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

.loop
	call .JoypadLoop
	jr c, .return
	ld c, 5
	call DelayFrames
	jr .loop
.return
	ret

.JoypadLoop:
	ldh a, [hJoypadDown]
	and A_BUTTON
	jr nz, .a
	ldh a, [hJoypadDown]
	and D_UP
	jr nz, .up
	ldh a, [hJoypadDown]
	and D_DOWN
	jr nz, .down
	ldh a, [hJoypadDown]
	and D_LEFT
	jr nz, .left
	ldh a, [hJoypadDown]
	and D_RIGHT
	jr nz, .right
	ret

.a
	scf
	ret

.up
	ld a, [wBuffer3]
	and a
	jr z, .up_buffer1
	ld hl, wBuffer2
	ld a, [hl]
	inc a
	cp 151
	jr nz, .up_not_zero2
	ld a, 1
.up_not_zero2
	ld [hl], a
	jr .DrawMenu
.up_buffer1
	ld hl, wBuffer1
	ld a, [hl]
	inc a
	cp 25 + 1
	jr nz, .up_not_zero
	ld a, 1
.up_not_zero
	ld [hl], a
	jr .DrawMenu

.down
	ld a, [wBuffer3]
	and a
	jr z, .down_buffer1
	ld hl, wBuffer2
	ld a, [hl]
	dec a
	and a
	jr nz, .down_not_zero2
	ld a, 150
.down_not_zero2
	ld [hl], a
	jr .DrawMenu
.down_buffer1
	ld hl, wBuffer1
	ld a, [hl]
	dec a
	and a
	jr nz, .down_not_zero
	ld a, 25
.down_not_zero
	ld [hl], a
	jr .DrawMenu

.left
	xor a
	ld [wBuffer3], a
	jr .DrawMenu

.right
	ld a, 1
	ld [wBuffer3], a
	jr .DrawMenu

.DrawMenu:
	; 박스 표시
	hlcoord 0, 7
	lb bc, 2, 18
	call TextBox

	hlcoord 1, 9
	ld de, .MapBank
	call PlaceString
	hlcoord 6, 9
	ld de, .MapNumber
	call PlaceString

	ld a, [wBuffer3]
	and a
	jr nz, .buffer2
	hlcoord 4, 7
	ld [hl], $61
	hlcoord 4, 10
	ld [hl], $ee
	jr .end_cursor
.buffer2
	hlcoord 9, 7
	ld [hl], $61
	hlcoord 9, 10
	ld [hl], $ee
.end_cursor

	; 출력값 표시 (뱅크)
	hlcoord 2, 9
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum
	; 출력값 표시 (번호)
	hlcoord 7, 9
	ld de, wBuffer2
	lb bc, 1, 3
	call PrintNum
	; 맵 이름 표시
	ld a, [wBuffer1]
	ld b, a
	ld a, [wBuffer2]
	ld c, a
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	hlcoord 11, 9
	call PlaceString

	call SafeUpdateSprites

	and a
	ret

.MapBank:   db "뱅크@"
.MapNumber: db "번호@"

; Warp
ASM_Warp:
	ld a, [wBuffer1]
	ld [wMapGroup], a
	ld a, [wBuffer2]
	ld [wMapNumber], a
	xor a
	ld [wXCoord], a
	ld [wYCoord], a
	ld a, -1
	ld [wDefaultSpawnpoint], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	; call StopScript
	ld hl, wScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret

; menu ===================================================
Menu_DebugMain:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 9, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "아이템 받기@"
	db "포켓몬 받기@"
	db "맵 이동!@"
	db "노트북@"
	db "닫기@"


; text =================================================
Text_PleaseSelection:
	text "디버그 모드로 진입했습니다"
	line "메뉴를 선택해주세요"
	done

Text_Test:
	text "메시지 출력 테스트"
	done

Text_SelectPokemon:
	text "포켓몬의 정보를 입력하세요"
	done

Text_SelectItem:
	text "아이템의 정보를 입력하세요"
	done

Text_Where:
	text "어디로 이동하겠습니까?"
	line "(오류 발생 가능 주의!)"
	done

endc
