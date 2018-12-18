landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName

NewBarkTownName:     db "연두마을@"
CherrygroveCityName: db "무궁시티@"
VioletCityName:      db "도라지시티@"
AzaleaTownName:      db "고동마을@"
GoldenrodCityName:   db "금빛시티@"
EcruteakCityName:    db "인주시티@"
OlivineCityName:     db "담청시티@"
CianwoodCityName:    db "진청시티@"
MahoganyTownName:    db "황토마을@"
BlackthornCityName:  db "검은먹시티@"
LakeOfRageName:      db "분노의 호수@"
SilverCaveName:      db "은빛 산@"
SproutTowerName:     db "모다피의 탑@"
RuinsOfAlphName:     db "알프의 유적@"
UnionCaveName:       db "연결동굴@"
SlowpokeWellName:    db "야돈 우물@"
RadioTowerName:      db "라디오타워@"
PowerPlantName:      db "발전소@"
NationalParkName:    db "자연 공원@"
TinTowerName:        db "방울탑@"
LighthouseName:      db "담청등대@"
WhirlIslandsName:    db "소용돌이 섬@"
MtMortarName:        db "절구산@"
DragonsDenName:      db "용의 굴@"
IcePathName:         db "얼음샛길@"
NotApplicableName:   db "유령의 집@"
PalletTownName:      db "태초마을@"
ViridianCityName:    db "상록시티@"
PewterCityName:      db "회색시티@"
CeruleanCityName:    db "블루시티@"
LavenderTownName:    db "보라타운@"
VermilionCityName:   db "갈색시티@"
CeladonCityName:     db "무지개시티@"
SaffronCityName:     db "노랑시티@"
FuchsiaCityName:     db "연분홍시티@"
CinnabarIslandName:  db "홍련섬@"
IndigoPlateauName:   db "석영고원@"
VictoryRoadName:     db "챔피언 로드@"
MtMoonName:          db "달맞이 산@"
RockTunnelName:      db "돌산 터널@"
LavRadioTowerName:   db "보라 라디오타워@"
SilphCoName:         db "실프주식회사@"
SafariZoneName:      db "사파리존@"
SeafoamIslandsName:  db "쌍둥이섬@"
PokemonMansionName:  db "포켓몬 저택@"
CeruleanCaveName:    db "블루시티 동굴@"
Route1Name:          db "1번 도로@"
Route2Name:          db "2번 도로@"
Route3Name:          db "3번 도로@"
Route4Name:          db "4번 도로@"
Route5Name:          db "5번 도로@"
Route6Name:          db "6번 도로@"
Route7Name:          db "7번 도로@"
Route8Name:          db "8번 도로@"
Route9Name:          db "9번 도로@"
Route10Name:         db "10번 도로@"
Route11Name:         db "11번 도로@"
Route12Name:         db "12번 도로@"
Route13Name:         db "13번 도로@"
Route14Name:         db "14번 도로@"
Route15Name:         db "15번 도로@"
Route16Name:         db "16번 도로@"
Route17Name:         db "17번 도로@"
Route18Name:         db "18번 도로@"
Route19Name:         db "19번 도로@"
Route20Name:         db "20번 도로@"
Route21Name:         db "21번 도로@"
Route22Name:         db "22번 도로@"
Route23Name:         db "23번 도로@"
Route24Name:         db "24번 도로@"
Route25Name:         db "25번 도로@"
Route26Name:         db "26번 도로@"
Route27Name:         db "27번 도로@"
Route28Name:         db "28번 도로@"
Route29Name:         db "29번 도로@"
Route30Name:         db "30번 도로@"
Route31Name:         db "31번 도로@"
Route32Name:         db "32번 도로@"
Route33Name:         db "33번 도로@"
Route34Name:         db "34번 도로@"
Route35Name:         db "35번 도로@"
Route36Name:         db "36번 도로@"
Route37Name:         db "37번 도로@"
Route38Name:         db "38번 도로@"
Route39Name:         db "39번 도로@"
Route40Name:         db "40번 도로@"
Route41Name:         db "41번 도로@"
Route42Name:         db "42번 도로@"
Route43Name:         db "43번 도로@"
Route44Name:         db "44번 도로@"
Route45Name:         db "45번 도로@"
Route46Name:         db "46번 도로@"
DarkCaveName:        db "어둠의 동굴@"
IlexForestName:      db "너도밤나무 숲@"
BurnedTowerName:     db "불탄 탑@"
FastShipName:        db "쾌속선@"
ViridianForestName:  db "상록숲@"
DiglettsCaveName:    db "디그다의 굴@"
TohjoFallsName:      db "동성폭포@"
UndergroundName:     db "지하통로@"
BattleTowerName:     db "배틀타워@"
SpecialMapName:      db "???@"
