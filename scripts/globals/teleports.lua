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
	player:setPos(522, -3, 545, 65, 0x2C)  -- to Purgonorgo Isle
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
	--elseif(option == 13) then	-- Jugner Forest [S]
	--	player:setPos();
	--elseif(option == 14) then	-- Jugner Forest
	--	player:setPos();
	--elseif(option == 15) then	-- Pashhow Marshlands [S]
	--	player:setPos();
	--elseif(option == 16) then	-- Pashhow Marshlands
	--	player:setPos();
	--elseif(option == 17) then	-- Meriphataud Mountains [S]
	--	player:setPos();
	--elseif(option == 18) then	-- Meriphataud Mountains
	--	player:setPos();
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

function debugTeleport(player,npcid)
	if(DEBUG_MODE == 1) then
		local npc = GetNPCByID(npcid);
		if(npc ~= nil) then
			player:setPos(npc:getXPos(), npc:getYPos(), npc:getZPos(), 0, npc:getZone());
		end
	end
end;