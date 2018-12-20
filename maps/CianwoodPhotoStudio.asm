	const_def 2 ; object constants
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	writetext CianwoodPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext CianwoodPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext CianwoodPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

CianwoodPhotoStudioFishingGuruText_Question:
	text "훌륭한 포켓몬을 데리고 있구나"
	line "등대에서 기념으로 1장"
	cont "포켓몬 사진 찍지 않을래?"
	done

CianwoodPhotoStudioFishingGuruText_Yes:
	text "그럼 간다"
	done

CianwoodPhotoStudioFishingGuruText_No:
	text "그런가 그렇다면 유감"
	line "여행의 기념이 될꺼라 생각했는데"
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1
