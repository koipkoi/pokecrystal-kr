	const_def 2 ; object constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafeChef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER1, LEFT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER2, RIGHT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER3, RIGHT
	end

CeladonCafeTeacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	itemtotext LEFTOVERS, MEM_BUFFER_0
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	itemtotext LEFTOVERS, MEM_BUFFER_0
	writetext FoundLeftoversText
	buttonsound
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "어서와요!"

	para "많이먹기 대회가"
	line "한창이다!"
	cont "미안하구나!"
	done

Fisher1Text_Snarfle:
	text "와구와구……!"
	done

Fisher1Text_Concentration:
	text "말 걸지마!"
	line "김 빠지잖아!"
	done

Fisher2Text_GulpChew:
	text "우걱우걱……!"
	done

Fisher2Text_Quantity:
	text "밥이란 맛 보다는 양이 최고!"
	line "배가 띵띵하면 만족이다!"
	done

Fisher3Text_MunchMunch:
	text "쩝쩝……!"
	done

Fisher3Text_GoldenrodIsBest:
	text "이곳도 맛있지만"
	line "역시 음식은"
	cont "금빛시티가 최고야!"
	done

TeacherText_CrunchCrunch:
	text "열심열심……!"
	done

TeacherText_NoCoinCase:
	text "이 가게에 동전 케이스를"
	line "주는 사람은 없어"
	cont "성도에서 찾아봐"
	done

TeacherText_KeepEating:
	text "으작으작……!"

	para "아직도 먹을 수 있어!"
	done

TeacherText_MoreChef:
	text "한그릇 더! 주인아저씨!"
	done

EatathonContestPosterText:
	text "많이먹기 대회!"
	line "시간 무제한"
	cont "끝이 없는 배틀!"
	cont "1등은 공짜가 되겠습니다!"
	done

FoundLeftoversText:
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer3
	text "를(을)"
	cont "발견했다!"
	done

NoRoomForLeftoversText:
	text "그러나 <PLAYER>는(은)"
	line "더 이상 도구를 지닐 수 없다!"
	done

CeladonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	db 5 ; object events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
