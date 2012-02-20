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
	
function toWindurstMissionOverseer(player)
	which = player:getVar("firstmissionguard");
	if (which == 1) then
		player:setPos(0, -16, 122, 198, 0xEF); -- Zokima-Rokima in Windurst Walls
	elseif (which == 2) then
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

function toCampaignDestination(player, option)
	if (option == 1) then 
		player:setPos(205.973,-23.5875,-206.606, 167, 0x89); -- Xarcabard [S] {R}
	elseif (option == 2) then
		player:setPos(-46.172,-60.1088,-38.487, 16, 0x88); -- Beaucedine Glacier [S] {R}
	elseif (option == 3) then 
		player:setPos(306.939, -1, -141.567, 173, 0x54); -- Batallia Downs [S] {R}
	elseif (option == 4) then 
		player:setPos(-4.701, 15.981, 235.996, 160, 0x5B); -- Rolanberry Fields [S] {R}
	elseif (option == 5) then 
		player:setPos(-64.212, 7.579, -51.292, 192, 0x62); -- Sauromugue Champaign [S] {R}
	elseif (option == 6) then 
		player:setPos(60.617, -3.952, 56.658, 64, 0x52); -- Jugner Forest [S] {R}
	elseif (option == 7) then 
		player:setPos(504.088, 24.442, 628.36, 69, 0x5A); -- Pashhow Marshlands [S] {R}
	elseif (option == 8) then 
		player:setPos(-447.084, 23.433, 586.847, 31, 0x61); -- Meriphataud Mountains [S] {R}
	elseif (option == 9) then 
		player:setPos(-77.817, -47.234, -302.732, 135, 0x53); -- Vunkerl Inlet [S] {R}
	elseif (option == 10) then 
		player:setPos(314.335, -36.368, -12.2, 192,0x59); -- Grauberg [S] {R}
	elseif (option == 11) then 
		player:setPos(141.021, -45, 19.543, 0, 0x60); -- Fort Karugo-Narugo [S] {R} 
	elseif (option == 12) then
		player:setPos(183.297, -19.9714, -240.895, 2, 0x51); -- East Ronfaure [S] {R}
	elseif (option == 13) then
		player:setPos(-441.332, 40, -77.986, 164, 0x58); -- North Gustaberg [S] {R}
	elseif (option == 14) then
		player:setPos(-104.707, -21.838, 258.043, 237, 0x5f);	-- West Sarutabaruta [S] {R}
	elseif (option == 15) then
		player:setPos(-98, 1, -41, 224, 0x50);	-- Southern San d'Oria [S] {approximated from memory}
	elseif (option == 16) then
		player:setPos(-291, -10, -107, 212, 0x57); -- Bastok Markets [S] {appoximated from memory}
	elseif (option == 17) then 
		player:setPos(-31.442, -5, 129.202, 128, 0x5E); --  Windurst Waters [S} {R}
	elseif (option == 18) then
		player:setPos(-194.095, 0, 30.009, 0, 0xA4); -- Garlaige Citdadel [S] {R}
	elseif (option == 19) then
		player:setPos(59.213, -32.158, -38.022, 64, 0xAB); -- Crawler's Nest [S] {R}
	elseif (option == 20) then
		player:setPos(294.35, -27.5, 19.947, 0, 0xAF); -- The Eldieme Necropolis [S] {R}
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
	if ((getVanaMinute() % 2 ) == 0) then
		player:setPos(133.4, 1.485, 47.427, 96, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Left {R}
	else
		player:setPos(116.67, 1.485, 47.427, 32, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Right {R}		
	end
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

	if (zone == 231) then		
		player:setPos(39.4, -0.2, 25, 253, zone);		-- Northern_San_d'Oria
	elseif (zone == 234) then	
		player:setPos(76.82, 0, -66.12, 232, zone);		-- Bastok_Mines
	elseif (zone == 240) then	
		player:setPos(185.6, -12, 223.5, 96, zone);		-- Port_Windurst
	elseif (zone == 248) then	
		player:setPos(14.67, -14.56, 66.69, 96, zone);	-- Selbina
	elseif (zone == 249) then	
		player:setPos(2.87, -4, 71.95, 0, zone);		-- Mhaura
	end
	
end;

function toCloisterOfFrost(player)
	player:setPos(554, 0, 589, 209, 203); -- Cloister of Frost (shiva)
end;

--Escape zones

function toEscape(player, zone)
	if(zone == 140 or zone == 141 or zone == 142) then 						-- From Ghelsba Outpost, Fort Ghelsba, Yughott Grotto
		player:setPos(-732,-64,611,45,100); 								-- To West Ronfaure at E-4
	elseif(zone == 157 or zone == 158 or zone == 184) then 					-- From Delkfutt's Tower - Middle, Upper, Lower
		player:setPos(-286,-19,320,255,126); 								-- To Qufim Island at F-6
	elseif(zone == 169 or zone == 192 or zone == 194 or zone == 170) then 	-- From Toraimarai Canal or Inner Horutoto Ruins or Outer Horutoto Ruins or Full Moon Fountain
		player:setPos(360,-13,99,128,116); 									-- To East Sarutabaruta at J-7
	elseif(zone == 16 or zone == 20 or zone == 18) then 					-- From Promyvion - Holla or Promyvion - Mea or Promyvion - Dem
		player:setPos(280,-80,-58,0,14); 									-- To Hall of Transference
	elseif(zone == 162 or zone == 161) then 								-- From Castle Zvahl Keep or Castle Zvahl Baileys
		player:setPos(-412,-43,19,254,112); 								-- To Xarcabard at G-7
	elseif(zone == 149 or zone == 150) then 								--From Davoi or Monastic Cavern
		player:setPos(-239,-7,-591,187,104); 								-- To Jugner Forest at G-12
	elseif(zone == 148 or zone == 147) then 								-- From Qulun Dome or Beadeaux
		player:setPos(553,25,-380,120,109); 								-- To Pashhow Marshlands at K-11
	elseif(zone == 177 or zone == 178) then 								--From Ve'Lugannon Palace or Shrine of Ru'Avitau
		player:setPos(0,-34,-471,185,130); 									-- To Ru'Aun Gardens at H-11
	elseif(zone == 152 or zone == 151) then 								-- From Altar Room or Castle Oztroja
		player:setPos(752,-32,-40,129,119); 								-- To Meriphataud Mountains at L-8
	elseif(zone == 159 or zone == 160) then 								-- From Temple of Uggalepih or Den of Rancor
		player:setPos(300,-4,-586,193,124); 								-- To Yhoator Jungle at J-11
	elseif(zone == 12 or zone == 11) then 									-- From Newton Movalpolos or Oldton Movalpolos
		player:setPos(552,-12,660,124,106); 								-- To North Gustaberg at K-6
	elseif(zone == 29 or zone == 30) then 									-- From Riverne - Site B01 or Riverne - Site A01
		player:setPos(-516,-32,359,6,25); 									-- To Misareaux Coast at D-6
	elseif(zone == 155 or zone == 138) then 								-- Fromn Castle Zvahl Keep (S) or Castle Zvahl Baileys (S)
		player:setPos(-418,-44,20,0,137); 									-- To Xarcabard (S) at G-7
	elseif(zone == 167) then 												-- From Bostaunieux Oubliette
		player:setPos(-663,-27,19,6,100); 									-- To West Ronfaure at F-8
	elseif(zone == 190) then 												-- From King Ranperre's Tomb
		player:setPos(200,0,-536,187,101); 									-- To East Ronfaure at H-11
	elseif(zone == 173) then 												-- From Korroloka Tunnel
		player:setPos(-72,0,20,255,172); 									-- To Zeruhn Mines at H-7
	elseif(zone == 195) then 												-- From The Eldieme Necropolis
		player:setPos(-403,-15,-128,187,105); 								-- To Batallia Downs at F-8
	elseif(zone == 166) then 												-- From Ranguemont Pass
		player:setPos(809,-63,649,98,101); 									-- To East Ronfaure at K-4
	elseif(zone == 9) then 													-- From Pso'Xja
		player:setPos(-414,-39,-420,255,111); 								-- To Beaucedine Glacier at E-11
	elseif(zone == 204) then 												-- From Fei'Yin
		player:setPos(280,20,568,61,111); 									-- To Beaucedine Glacier at J-4
	elseif(zone == 197) then 												-- From Crawlers' Nest
		player:setPos(-372,-28,-772,0,110); 								-- To Rolanberry Fields at F-13
	elseif(zone == 153) then 												-- From The Boyahda Tree
		player:setPos(508,2,-577,133,121); 									-- To The Sanctuary of Zi'Tah at K-12
	elseif(zone == 154) then												-- From Dragon's Aery
		player:setPos(213,0,-179,240,121)									-- To The Sanctuary of Zi'Tah at 
	elseif(zone == 200) then 												-- From Garlaige Citadel
		player:setPos(-104,-24,-408,189,120); 								-- To Sauromugue Champaign at H-10
	elseif(zone == 213) then 												-- From Labyrinth of Onzozo
		player:setPos(446,18,192,48,118); 									-- To Buburimu Peninsula at K-6
	elseif(zone == 198) then 												-- From Maze of Shakhrami
		player:setPos(445,47,485,79,117); 									-- To Tahrongi Canyon at K-5
	elseif(zone == 145) then 												-- From Giddeus
		player:setPos(-369,-21,68,220,115); 								-- To West Sarutabaruta at F-8
	elseif(zone == 205) then 												-- From Ifrit's Cauldron
		player:setPos(97,0,341,110,124); 									-- To Yhoator Jungle at I-6
	elseif(zone == 176) then 												-- From Sea Serpent Grotto
		player:setPos(-492,17,-376,10,123);									-- To Yuhtunga Jungle at E-11
	elseif(zone == 191) then 												-- From Dangruf Wadi
		player:setPos(-596,39,-520,4,107); 									-- To South Gustaberg at D-9
	elseif(zone == 143) then 												-- From Palborough Mines
		player:setPos(484,-32,1166,106,106); 								-- To North Gustaberg at K-3
	elseif(zone == 208) then 												-- From Quicksand Caves
		player:setPos(408,-9,-16,131,114); 									-- To Eastern Altepa Desert at J-8
	elseif(zone == 174) then 												-- From Kuftal Tunnel
		player:setPos(-65,-3,454,79,125); 									-- To Western Altepa Desert at H-4
	elseif(zone == 212) then 												-- From Gustav Tunnel
		player:setPos(-783,-8,20,130,103); 									-- To Valkurm Dunes at B-8
	elseif(zone == 196) then 												-- From Gusgen Mines
		player:setPos(686,21,204,101,108); 									-- To Konschtat Highlands at L-7
	elseif(zone == 193) then 												-- From Ordelle's Caves
		player:setPos(-259,23,111,190,102); 								-- To La Theine Plateau at F-7
	elseif(zone == 28) then 												-- From Sacrarium
		player:setPos(23,-24,732,74,25);	 								-- To Misareaux Coast at G-4
	elseif(zone == 27) then 												-- From Phomiuna Aqueducts
		player:setPos(566,-15,279,125,25) 									-- To Misareaux Coast at K-7
	elseif(zone == 68) then 												-- From Aydeewa Subterrane
		player:setPos(87,-12,418,5,51); 									-- To Wajaom Woodlands at I-6
	elseif(zone == 65) then 												-- From Mamook
		player:setPos(-459,-1,-535,191,51); 								-- To Wajaom Woodlands at E-12
	elseif(zone == 62) then 												-- From Halvung
		player:setPos(868,-9,179,128,61); 									-- To Mount Zhayolm at L-7
	elseif(zone == 54) then 												-- From Arrapago Reef
		player:setPos(166,-12,-59,249,79); 									-- To Caedarva Mire Azouph Isle at I-6
	elseif(zone == 72) then 												-- From Alzadaal Undersea Ruins
		player:setPos(20,-28,590,62,52); 									-- To Bhaflau Thickets at F-6
	elseif(zone == 85) then 												-- From La Vaule (S)
		player:setPos(-200,-7,-502,197,82); 								-- To Jugner Forest (S) at G-12
	elseif(zone == 92) then 												-- From Beadeaux (S)
		player:setPos(540,25,-347,191,90); 									-- To Pashhow Marshlands (S) at K-11
	elseif(zone == 99) then 												-- From Castle Oztroja (S)
		player:setPos(730,-32,-39,127,97); 									-- To Meriphataud Mountains (S) at L-8
	elseif(zone == 164) then 												-- From Garlaige Citadel (S)
		player:setPos(-102,-23,-400,204,98); 								-- To Sauromugue Champaign (S) at H-10
	elseif(zone == 175) then 												-- From The Eldieme Necropolis (S)
		player:setPos(-401,-8,-197,185,84); 								-- To Batallia Downs (S) F-9
	elseif(zone == 171) then 												-- From Crawlers' Nest (S)
		player:setPos(-373,-28,772,218,91); 								-- To Rolanberry Field (S) F-13
	end;
end;