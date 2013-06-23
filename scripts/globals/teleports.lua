-----------------------------------
--	A collection of frequently needed teleport shortcuts.
-- 	by ReaperX
-- 	coordinates marked {R} have been obtained by packet capture from retail. Don't change them.
-----------------------------------

function toFeiYin(player)
	player:setPos(280, 20, 543, 192, 0x6F);
end;

function toQuHauSpring(player)
	player:setPos(0,-30,60,192,0x7A);
end;

function toMhaura(player)
	player:setPos(0,-8,41,64,0xF9);
end;

function toBatalliaDowns(player)
	player:setPos(180,8,-420,167,0x69); -- to main entrance of the Eldieme Necropolis.
end;

function toThroneRoom(player)
	player:setPos(72, -4, 0, 128, 0xA5);
end;

function toRuLudeEmbassyArea(player)
	player:setPos(0, 7, -23, 63, 0xF3);
end;

function toOrastery(player)
	player:setPos(-108, -3, 105, 90, 0xF0);  -- to Port Windurst Orastery
end;

function toOptistery(player)
	player:setPos(-27, -5, 101, 172, 0xEE);  -- to Tosuka - Porika (Optistery)
end;

function toAurastery(player)
	player:setPos(170, -1.2, 160, 87, 0xEE); -- to Moreno-Toeno (Aurastery)
end;

function toManustery(player)
	player:setPos(-14, -3, 14, 221, 0xF1);   -- to Apururu (Manustery)
end;

function toRhinostery(player)
	player:setPos(-5, -4, -182, 252, 0xEE);
end;

function toAnimastery(player)
	player:setPos(62, 20, -59, 223, 0xA9); -- to Toraimarai Canal
end;

function toStarSibyl(player)
	player:setPos(2, -45, -28, 180, 0xF2);   -- to Star Sibyl chamber, Heaven's Tower
end;

function toHeavensTower(player)
	player:setPos(0, 0, -14, 192, 0xF2); -- to entrance (first?) floor of Heaven's Tower.
end;

function toLeepeHoppe(player)
	player:setPos(17, -10, -200, 139, 0xEE);
end;

function toFullMoonFountain(player)
	player:setpos(-260, 4, -325, 192, 0xAA);
end;

function toRukususu(player)
	player:setPos(-193,0,190,128,0xCC); -- to Rukususu @ Fei'Yin
end;

function toShantotto(player)
	player:setPos(121, -3, 113, 212, 0xEF);  -- to Shantotto
end;

function toLilyTower(player)
	player:setPos(362, -13, 100, 0, 0x74); -- to J-7 in East Saru, entrance "5" to Inner Horutoto Ruins.
end;

function toMargueriteTower(player)
	player:setPos(259, -18, -432, 61, 0x74); -- to J-11 in East Saru, entrance "4" to Outer Horutoto Ruins.
end;

function toRoseTower(player)
	player:setPos(-259, 0, 100, 192, 0xC0); -- to H-7 Inner Horutoto Ruins, behind 3 Mages' Gate, room with elemental gates.
end;

function toDahliaTower(player)
	player:setPos(-300, 0, -660, 255, 0xC2); -- this is the SW tower in West Saru at F-11 that's filled with Cardians.
end;

function toAmaryllisTower(player)
	player:setPos(-421, 0, 620, 128, 0xC2); -- to Outer Horutoto Ruins, NW tower,G-8
end;

function toCatBurglar(player)
	player:setPos(60,-5,239,0,0xF1); -- to Nanaa Mihgo
end;

function toPerihVashai(player)
	player:setPos(118,-4,98,66,0xF1); -- to RNG quest NPC
end;

function toCatBurglarsHideout(player)
	player:setPos(-5, 0, 21, 128, 0xC0); -- to G-8 in Inner Horutoto Ruins, Beetle's Burrow, in front of Mahagony Door.
end;

function toHouseOfTheHero(player)
	player:setPos(-26, -12, 253, 194, 0xEF); -- to the House of the Hero, G-4 Windurst Walls.
end;

function toKupipi(player)
	player:setPos(0, 0, 28, 206, 0xF2);
end;

function toZubaba(player)
	player:setPos(13, -26.25, 15, 222, 0xf2) -- to Zubaba in Heaven's Tower.
end;

function toPurgonorgo(player)
	player:setPos(522, -3, 545, 65, 0x2C)  -- to Abdhaljs Purgonorgo Isle
end;

function toPurgonorgoBibiki(player)
	player:setPos(-382, -2, -428, 190, 0x04)  -- to Purgonorgo Isle (bibiki bay)
end;

function toWindurstMissionOverseer(player)
	which = player:getVar("firstmissionguard");
	if(which == 1) then
		player:setPos(0, -16, 122, 198, 0xEF); -- Zokima-Rokima in Windurst Walls
	elseif(which == 2) then
		player:setPos(107, -5, -24, 248, 0xF1); -- Rakoh Buuma in Windurst Woods
	end;
end;

function toAltep(player)
	player:setPos(-61.942,3.949,224.9,0,0x72); -- to Altep Telepoint {R}
end;

function toYhoat(player)
	player:setPos(-280.942,0.596,-144.156,0,0x7c); -- to Yhoat Telepoint {R}
end;

function toVahzl(player)
	player:setPos(150.258,-21.048,-37.256,94,0x70); -- to Vahzl Teleport {R}
end;

function toDem(player)
	player:setPos(220,19.104,300,0,0x6c); -- Dem Telepoint {R}
end;

function toHolla(player)
	player:setPos(420,19.104,20,0,0x66); -- Holla Telepoint {R}
end;

function toMea(player)
	player:setPos(100,35.1506,340,0,0x75); -- Mea Telepoint {R}
end;

function toRomaaMigho(player)
	player:setPos(29, -12, -174, 68, 0xFA); -- to H-11 in Kazham (Migho's Residence)
end;

function toCathedral(player)
	player:setPos(148, 0, 139, 220, 0xE7);	-- to Arnau in the San d'Oria Cathedral
end;

function toChateaudOraguille(player)
	player:setPos(0, 0, 0, 192, 0xE9);
end;

function toGhelsba(player)
	player:setPos(-156, -10, 80, 119, 0x8C); -- to the BCNM hut in Ghelsba Outpost.
end;

function toDrogarogasSpine(player)
	player:setPos(644,-16,0,185,0x77);	-- to eastern portion of Drogaroga's Spine in Meriphataud Mountains.
end;

function toSkyGreenPorterLeft(player)
	player:setPos(-134.145, -32.327, -205.947, 215, 0x82); -- {R}
end;

function toHallofTransferenceDem(player)
	player:setPos(-267.194, -40.634, -280.019, 0, 0xE); -- {R}
end;

function toHallofTransferenceHolla(player)
	player:setPos(-266.76, -0.6337, 280.058, 0, 0xE); -- {R}
end;

function PromyvionHollaExitPosition(player)
	player:setPos(-225.682, -6.4595, 280.002, 128, 0xE); -- {R}
end;

function PromyvionHollaEntryPosition(player)
	player:setPos(92.033, 0, 80.38, 255, 0xE); -- {R}
end;

function toHallofTransferenceMea(player)
	player:setPos(280.066, -80.63337, -67.096, 192, 0xE); -- {R}
end;

function toPalaceEntrance(player)
	player:setPos(-25, 0, -615, 200, 0x21);	-- to Palace Entrance in Al'Taieu.
end;

function toSelbina(player)
	player:setPos(-57.329,-0.959,-45.690,125,0xF8); --to Isacio for subjob quest
end;

function toWajaomPukCamp(player)  -- Just a camp just for puks \\ disregard
	player:setPos(-174.223,-20.132,-564.999,187,0x33);
end;

function toBalasiel(player) -- Teles to Balasiel
	player:setPos(-136.078,-10.800,63.500,162,0xE6);
end;

function toWaterLeaper(player) -- teleport to Water Leaper for Impulse Drive WSNM
	player:setPos(108.156,0.500,-121.639,775,0xB0);
end;

function toMiaux(player)  --- Teleport back to Miaux for DRG AF1 complete
	player:setPos(-170.509,4,159.737,7959,0xE7);
end;

function toAltepaDesert(player) -- Teleport to ??? for DRG AF1
	player:setPos(115.859,-7.916,-74.276,8076,0x72);
end;

-- Swirling Vortex

function toLufaiseMeadows(player) -- Teleport Valkurm Dunes > Lufaise Meadows
	player:setPos(459,8,3,56,0x18);
end;

function toValkurmDunes(player) -- Teleport Lufaise Meadows > Valkurm Dunes
	player:setPos(418,0,-202,82,0x67);
end;

function toMisareauxCoast(player) -- Teleport Qufim Island > Misareaux Coast
	player:setPos(-115,-32,219,2,0x19);
end;

function toQufimIsland(player) -- Teleport Misareaux Coast > Qufim Island
	player:setPos(-438,-13,340,134,0x7E);
end;

-- -----------------

function toCampaignDestination(player, option)
	if(option == 1) then
		player:setPos(205.973,-23.5875,-206.606, 167, 0x89); -- Xarcabard [S] {R}
	elseif(option == 2) then
		player:setPos(-46.172,-60.1088,-38.487, 16, 0x88); -- Beaucedine Glacier [S] {R}
	elseif(option == 3) then
		player:setPos(306.939, -1, -141.567, 173, 0x54); -- Batallia Downs [S] {R}
	elseif(option == 4) then
		player:setPos(-4.701, 15.981, 235.996, 160, 0x5B); -- Rolanberry Fields [S] {R}
	elseif(option == 5) then
		player:setPos(-64.212, 7.579, -51.292, 192, 0x62); -- Sauromugue Champaign [S] {R}
	elseif(option == 6) then
		player:setPos(60.617, -3.952, 56.658, 64, 0x52); -- Jugner Forest [S] {R}
	elseif(option == 7) then
		player:setPos(504.088, 24.442, 628.36, 69, 0x5A); -- Pashhow Marshlands [S] {R}
	elseif(option == 8) then
		player:setPos(-447.084, 23.433, 586.847, 31, 0x61); -- Meriphataud Mountains [S] {R}
	elseif(option == 9) then
		player:setPos(-77.817, -47.234, -302.732, 135, 0x53); -- Vunkerl Inlet [S] {R}
	elseif(option == 10) then
		player:setPos(314.335, -36.368, -12.2, 192,0x59); -- Grauberg [S] {R}
	elseif(option == 11) then
		player:setPos(141.021, -45, 19.543, 0, 0x60); -- Fort Karugo-Narugo [S] {R}
	elseif(option == 12) then
		player:setPos(183.297, -19.9714, -240.895, 2, 0x51); -- East Ronfaure [S] {R}
	elseif(option == 13) then
		player:setPos(-441.332, 40, -77.986, 164, 0x58); -- North Gustaberg [S] {R}
	elseif(option == 14) then
		player:setPos(-104.707, -21.838, 258.043, 237, 0x5f);	-- West Sarutabaruta [S] {R}
	elseif(option == 15) then
		player:setPos(-98, 1, -41, 224, 0x50);	-- Southern San d'Oria [S] {approximated from memory}
	elseif(option == 16) then
		player:setPos(-291, -10, -107, 212, 0x57); -- Bastok Markets [S] {appoximated from memory}
	elseif(option == 17) then
		player:setPos(-31.442, -5, 129.202, 128, 0x5E); --  Windurst Waters [S} {R}
	elseif(option == 18) then
		player:setPos(-194.095, 0, 30.009, 0, 0xA4); -- Garlaige Citdadel [S] {R}
	elseif(option == 19) then
		player:setPos(59.213, -32.158, -38.022, 64, 0xAB); -- Crawler's Nest [S] {R}
	elseif(option == 20) then
		player:setPos(294.35, -27.5, 19.947, 0, 0xAF); -- The Eldieme Necropolis [S] {R}
	end;
end;

function toMaw(player, option)
	if(option == 1) then 		-- Batallia Downs [S]
		player:setPos(-48, 0, 437, 52, 0x54);
	elseif(option == 2) then	-- Batallia Downs
		player:setPos(-49, 0, 435, 1, 0x69);
	elseif(option == 3) then	-- Rolanberry Fields [S]
		player:setPos(-190, -8, 363, 11, 0x5b);
	elseif(option == 4) then	-- Rolanberry Fields
		player:setPos(-193, 8, 360, 0, 0x6e);
	elseif(option == 5) then	-- Sauromugue Champaign [S]
		player:setPos(372, 9, -228, 27, 0x62);
	elseif(option == 6) then	-- Sauromugue Champaign
		player:setPos(370, 8, -228, 0, 0x78);
	elseif(option == 7) then	-- West Sarutabaruta [S]
		player:setPos(0, 0, -164, 29, 0x5f);
	elseif(option == 8) then	-- West Sarutabaruta
		player:setPos(0, 0, -164, 29, 0x73);
	elseif(option == 9) then	-- East Ronfaure [S]
		player:setPos(320, -60, 500, 79, 0x51);
	elseif(option == 10) then	-- East Ronfaure
		player:setPos(320, -60, 500, 79, 0x65);
	elseif(option == 11) then	-- North Gustaberg [S]
		player:setPos(469, 0, 479, 254, 0x58);
	elseif(option == 12) then	-- North Gustaberg
		player:setPos(469, 0, 479, 254, 0x6A);
	elseif(option == 13) then	-- Jugner Forest [S]
		player:setPos(-117,-8,-519,254,0x52);
	elseif(option == 14) then	-- Jugner Forest
		player:setPos(-117,-8,-519,254,0x68);
	elseif(option == 15) then	-- Pashhow Marshlands [S]
		player:setPos(418,25,27,105,0x5A);
	elseif(option == 16) then	-- Pashhow Marshlands
		player:setPos(418,25,27,105,0x6D);
	elseif(option == 17) then	-- Meriphataud Mountains [S]
		player:setPos(597,-32,279,95,0x61);
	elseif(option == 18) then	-- Meriphataud Mountains
		player:setPos(597,-32,279,95,0x77);
	-- Abyessa Maws
		--Tahrongi Canyon (H-12)
		--Konschtat Highlands (I-12)
		--La Theine Plateau (E-4)
		--Valkurm Dunes (I-9)
		--Jugner Forest (J-8)
		--Buburimu Peninsula (F-7)
		--South Gustaberg (J-10)
		--North Gustaberg (G-6)
		--Xarcabard (H-8)
	end;
end;

function recallJugner(player)
	player:setPos(-122.862, 0, -163.154, 192, 0x52);  -- {R}
end;

function recallMeriph(player)
	player:setPos(305.989, -14.978, 18.96, 192, 0x61);  -- {R}
end;

function recallPashh(player)
	player:setPos(345.472, 24.28, -114.731, 99, 0x5A);  -- {R}
end;

function AzouphIsleStagingPoint(player)
	player:setPos(522.73, -28.009, -502.621, 161, 0x4f); -- to Caedarva Mire {R}
end;

function MamoolJaStagingPoint(player)
	player:setPos(-210.291, -11.5, -818.056, 255, 0x34); -- to Bhauflau Thickets {R}
end;

function HalvungStagingPoint(player)
	player:setPos(688.994, -23.96, 351.496, 191, 0x3d); -- to Mount Zhayolm {R}
end;

function IlrusiAtollStagingPoint(player)
	player:setPos(17.54, -7.25, 627.968, 254, 0x36); -- to Arrapago Reef {R}
end;

function DvuccaIsleStagingPoint(player)
	player:setPos(-265.632, -6, -29.472, 94, 0x4f); -- to Caedarva Mire {R}
end;

function NzyulIsleStagingPoint(player)
	player:setPos(222.798, -0.5, 19.872, 0, 0x48); -- to Alzadaal Undersea Ruins {R}
end;

function toChamberOfPassage(player)
	if(math.random(1,2) == 1) then
		player:setPos(133.4, 1.485, 47.427, 96, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Left {R}
	else
		player:setPos(116.67, 1.485, 47.427, 32, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Right {R}
	end
end;

function toAhtUrhganWhitegate(player)
	player:setPos(27.608, -6.000, -124.462, 192, 0x32);
end;

function LebrosCavern1(player)
	player:setPos(124.999, -39.31071, 19.999,0x3F); -- Lebros Cavern Rank 1 (Excavation Duty)
end;

function LebrosCavernExit(player)
	player:setPos(681.95, -24, 369.936,64, 0x3D); -- Mount Z position after exiting.
end;

function MamoolJaTrainingGround1(player)
	player:setPos(-20, -2.271, -405, 63, 0x42); -- Mamool Ja Training Grounds Rank 1
end;

function MamoolJaTrainingExit(player)
	player:setPos(-172.863, -12.25, -801.021, 128, 0x34);  -- after exiting Mamool ja Training Grounds
end;

function LeujaoamSanctum1(player)
	player:setPos(280, -7.5, 35 , 195); -- Leujaoam Sanctum, Rank 1
end;

function LeujaoamSanctumExit(player)
	player:setPos(495.45001, -28.25, -478.43, 32, 0x4f); -- after exiting Leujaoam Sanctum
end;

function toExplorerMoogle(player,zone)
	if(zone == 231) then
		player:setPos(39.4, -0.2, 25, 253, zone);		-- Northern_San_d'Oria
	elseif(zone == 234) then
		player:setPos(76.82, 0, -66.12, 232, zone);		-- Bastok_Mines
	elseif(zone == 240) then
		player:setPos(185.6, -12, 223.5, 96, zone);		-- Port_Windurst
	elseif(zone == 248) then
		player:setPos(14.67, -14.56, 66.69, 96, zone);	-- Selbina
	elseif(zone == 249) then
		player:setPos(2.87, -4, 71.95, 0, zone);		-- Mhaura
	end
end;

function toCloisterOfFrost(player)
	player:setPos(554, 0, 589, 209, 203); -- Cloister of Frost (shiva)
end;

function toRuLudeGardens(player)
	player:setPos(0.000, 9.000, -38.670, -67, 243);
end;

function toWajaomLaypoint(player)  -- Wajaom Woodlands Laypoint
	player:setPos(-200,-10,80,125,0x33);
end;

-----------------------------------
-- Teleport Items
-----------------------------------

function duchyEarring(player)
	player:setPos(5,0,-6,0,0xF4);
end;

function cobraStaff(player)
	player:setPos(-39,-5,231,68,0x5E);
end;

function ducalGaurdRing(player)
	player:setPos(48.930,10.002,-71.032,195,0xF3);
end;

function federationEarring(player)
	player:setPos(160,0,-10,0,238);
end;

function federationStablesScarf(player)
	player:setPos(123,-6,-134,0,241);
end;

function fourthStaff(player)
	player:setPos(-291, -10, -107, 212, 0x57);
end;

function homingRing(player)
	zone = player:getZone();
	-- Ronfaure
	if(zone == 100 or zone == 101 or zone == 139 or zone == 140 or zone == 141 or zone == 142 or zone == 190 or zone == 167 or zone == 230 or zone == 231 or zone == 232 or zone == 233) then
		player:setPos(-446, -20 , -220, 0, 100);
	-- Zulkheim
	elseif(zone == 248 or zone == 102 or zone == 103 or zone == 108 or zone == 193 or zone == 196) then
		player:setPos(149, -7 , 94, 154, 103);
	-- Norvallen
	elseif(zone == 104 or zone == 105 or zone == 1 or zone == 2 or zone == 149 or zone == 150 or zone == 195) then
		player:setPos(62, 0 , -1, 67, 104);
	-- Gustaberg
	elseif(zone == 234 or zone == 235 or zone == 236 or zone == 237 or zone == 106 or zone == 107 or zone == 172 or zone == 191 or zone == 143 or zone == 173 or zone == 144) then
		player:setPos(-579, 39 , 62, 89, 106);
	-- Derfland
	elseif(zone == 110 or zone == 109 or zone == 197 or zone == 148 or zone == 147) then
		player:setPos(465, 24 , 422, 29, 109);
	-- Sarutabatura
	elseif(zone == 238 or zone == 239 or zone == 240 or zone == 241 or zone == 242 or zone == 115 or zone == 116 or zone == 169 or zone == 170 or zone == 192 or zone == 194 or zone == 145 or zone == 146) then
		player:setPos(-15, -13 , 318, 128, 115);
	-- Kolshushu
	elseif(zone == 249 or zone == 4 or zone == 117 or zone == 118 or zone == 198 or zone == 213) then
		player:setPos(-480, -30 , 57, 62, 118);
	-- Aragoneu
	elseif(zone == 7 or zone == 119 or zone == 120 or zone == 200 or zone == 151 or zone == 152 or zone == 8) then
		player:setPos(-298, 17 , 418, 98, 119);
	-- Fauregandi
	elseif(zone == 111 or zone == 166 or zone == 9 or zone == 204 or zone == 10 or zone == 206 or zone == 203) then
		player:setPos(-18, -59, -108, 100, 111);
	-- Valdeaunia
	elseif(zone == 112 or zone == 5 or zone == 161 or zone == 162 or zone == 165 or zone == 6) then
		player:setPos(210, -23, -206, 160, 112);
	-- Qufim Island
	elseif(zone == 127 or zone == 126 or zone == 157 or zone == 158 or zone == 184 or zone == 179) then
		player:setPos(-246, -20 , 301, 192, 126);
	-- Lil'Telor
	elseif(zone == 122 or zone == 121 or zone == 251 or zone == 153 or zone == 154 or zone ==202) then
		player:setPos(-38, 0, -140, 69, 121);
	-- Kuzotz
	elseif(zone == 247 or zone == 114 or zone == 125 or zone == 208 or zone == 209 or zone == 168) then
		player:setPos(-250, 8, -252, 122, 114);
	-- Vollbow
	elseif(zone == 113 or zone == 128 or zone == 174 or zone == 212 or zone == 201) then
		player:setPos(-184, 8, -66, 0, 113);
	-- Elshimo Lowlands
	elseif(zone == 250 or zone == 252 or zone == 176 or zone == 123) then
		player:setPos(-243, 0, -400, 192, 123);
	-- Elshimo Uplands
	elseif(zone == 124 or zone == 159 or zone == 160 or zone == 205 or zone == 163 or zone == 211 or zone == 207) then
		player:setPos(203, 0, -82, 36, 124);
	-- Tulia ?!
	elseif(zone == 130 or zone == 177 or zone == 178 or zone == 180 or zone == 181) then
		player:setPos(4, -54, -600, 192, 130);
	-- Tavnazia
	elseif(zone == 26 or zone == 25 or zone ==24 or zone == 28 or zone == 29 or zone == 30 or zone == 31 or zone == 32 or zone == 27) then
		player:setPos(-535, -6, -53, 122, 24);
	end
end;

function kazhamEarring(player)
	player:setPos(-1,-4,-6,0,250);
end;

function kingdomEarring(player)
	player:setPos(154,-2,152,0,230);
end;

function kingdomStablesScarf(player)
	player:setPos(-7,2,-84,0,230);
end;

function laurelCrown(player)
	player:setPos(50,0,-18,0,243);
end;

function maatsCap(player)
	player:setPos(11,3,117,0,243);
end;

function mhauraEarring(player)
	player:setPos(0,-4,109,0,249);
end;

function nashmauEarring(player)
	player:setPos(11,2,-94,0,53);
end;

function nomadCap(player)
	nation = player:getNation();
	if (nation == 0) then
		player:setPos(0154,-2,152,0,230);
	elseif (nation == 1) then
		player:setPos(84,0,-71,0,234);
	elseif (nation == 2) then
		player:setPos(-211,0,-119,0,239);
	end
end;

function norgEarring(player)
	player:setPos(-19,0,-53,0,252);
end;

function rabaoEarring(player)
	player:setPos(9,-2,-91,0,247);
end;

function ramStaff(player)
	player:setPos(-98, 1, -41, 224, 0x50);
end;

function republicEarring(player)
	player:setPos(-302,-12,-68,0,235);
end;

function republicStablesMedal(player)
	player:setPos(40,0,-90,0,234);
end;

function returnRing(player)
	local zone = player:getZone();
	-- Ronfaure
	if(zone == 100 or zone == 101 or zone == 139 or zone == 140 or zone == 141 or zone == 142 or zone == 190 or zone == 167 or zone == 230 or zone == 231 or zone == 232 or zone == 233) then
		player:setPos(-446, -20 , -220, 0, 100);
	-- Zulkheim
	elseif(zone == 248 or zone == 102 or zone == 103 or zone == 108 or zone == 193 or zone == 196) then
		player:setPos(149, -7 , 94, 154, 103);
	-- Norvallen
	elseif(zone == 104 or zone == 105 or zone == 1 or zone == 2 or zone == 149 or zone == 150 or zone == 195) then
		player:setPos(62, 0 , -1, 67, 104);
	-- Gustaberg
	elseif(zone == 234 or zone == 235 or zone == 236 or zone == 237 or zone == 106 or zone == 107 or zone == 172 or zone == 191 or zone == 143 or zone == 173 or zone == 144) then
		player:setPos(-579, 39 , 62, 89, 106);
	-- Derfland
	elseif(zone == 110 or zone == 109 or zone == 197 or zone == 148 or zone == 147) then
		player:setPos(465, 24 , 422, 29, 109);
	-- Sarutabatura
	elseif(zone == 238 or zone == 239 or zone == 240 or zone == 241 or zone == 242 or zone == 115 or zone == 116 or zone == 169 or zone == 170 or zone == 192 or zone == 194 or zone == 145 or zone == 146) then
		player:setPos(-15, -13 , 318, 128, 115);
	-- Kolshushu
	elseif(zone == 249 or zone == 4 or zone == 117 or zone == 118 or zone == 198 or zone == 213) then
		player:setPos(-480, -30 , 57, 62, 118);
	-- Aragoneu
	elseif(zone == 7 or zone == 119 or zone == 120 or zone == 200 or zone == 151 or zone == 152 or zone == 8) then
		player:setPos(-298, 17 , 418, 98, 119);
	-- Fauregandi
	elseif(zone == 111 or zone == 166 or zone == 9 or zone == 204 or zone == 10 or zone == 206 or zone == 203) then
		player:setPos(-18, -59, -108, 100, 111);
	-- Valdeaunia
	elseif(zone == 112 or zone == 5 or zone == 161 or zone == 162 or zone == 165 or zone == 6) then
		player:setPos(210, -23, -206, 160, 112);
	-- Qufim Island
	elseif(zone == 127 or zone == 126 or zone == 157 or zone == 158 or zone == 184 or zone == 179) then
		player:setPos(-246, -20 , 301, 192, 126);
	-- Lil'Telor
	elseif(zone == 122 or zone == 121 or zone == 251 or zone == 153 or zone == 154 or zone ==202) then
		player:setPos(-38, 0, -140, 69, 121);
	-- Kuzotz
	elseif(zone == 247 or zone == 114 or zone == 125 or zone == 208 or zone == 209 or zone == 168) then
		player:setPos(-250, 8, -252, 122, 114);
	-- Vollbow
	elseif(zone == 113 or zone == 128 or zone == 174 or zone == 212 or zone == 201) then
		player:setPos(-184, 8, -66, 0, 113);
	-- Elshimo Lowlands
	elseif(zone == 250 or zone == 252 or zone == 176 or zone == 123) then
		player:setPos(-243, 0, -400, 192, 123);
	-- Elshimo Uplands
	elseif(zone == 124 or zone == 159 or zone == 160 or zone == 205 or zone == 163 or zone == 211 or zone == 207) then
		player:setPos(203, 0, -82, 36, 124);
	-- Tulia ?!
	elseif(zone == 130 or zone == 177 or zone == 178 or zone == 180 or zone == 181) then
		player:setPos(4, -54, -600, 192, 130);
	-- Tavnazia
	elseif(zone == 26 or zone == 25 or zone ==24 or zone == 28 or zone == 29 or zone == 30 or zone == 31 or zone == 32 or zone == 27) then
		player:setPos(-535, -6, -53, 122, 24);
	end
end;

function safeholdEarring(player)
	player:setPos(9,-9,11,0,26);
end;

function selbinaEarring(player)
	player:setPos(17,-14,95,0,248);
end;

function olduumRing(player)
	player:setPos(-199, -10, 80, 94, 51);
end;

function starsCap(player)
	player:setPos(50,0,-18,0,243);
end;

function tavnzanianRing(player)
	player:setPos(9,-9,11,0,26);
end;