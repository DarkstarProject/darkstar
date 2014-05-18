-----------------------------------
-- Author: Ezekyel
-- this function is used for npcs that change position every vanadiel game day
-----------------------------------
require("scripts/globals/harvest_festivals");
-----------------------------------
function OnGameDayAutomatisation()
	
	-- Storage Hole in Davoi
	local storHolePos = {--[[E-10]]{-177.925,4.000,-255.699},--[[F-6]]{-127.703,4.250,23.732}, --[[F-7]]{-127.822,4.250,-16.964},--[[F-9]]{-123.369,4.000,-231.972},--[[G-9]]{-51.570,4.127,-216.462},
						 --[[G-10]]{-55.960,2.958,-300.014}, --[[I-7]]{152.311,4.000,-74.176}, --[[I-8]]{153.514,4.250,-112.616},--[[J-7]]{188.988,4.000,-80.058},  --[[K-7]]{318.694,0.001,-58.646},
						 --[[K-8]]{299.717,0.001,-160.910},  --[[K-9]]{274.849,4.162,-213.599},--[[K-9]]{250.809,4.000,-240.509},--[[J-8]]{219.474,3.750,-128.170}, --[[I-9]]{86.749,-5.166,-166.414}};
	
	local storageHole = GetNPCByID(17388019);
	local randPos = 0;
	
	while(randPos == 0 or storHolePos[randPos][1] == storageHole:getXPos()) do
		randPos = math.random(1,15);
	end
	
	storageHole:setPos(storHolePos[randPos][1],storHolePos[randPos][2],storHolePos[randPos][3],0);
	
	-- Labyrinth of sacrarium
	local day = VanadielDayElement() ;
	local tbl;
	local SacrariumWallOffset = 16892108;
	
	if(day == 3 or day == 7) then
		tbl = {9,9,8,8,9,9,8,9,8,8,9,8,8,8,9,8,9,8};
	elseif(day == 1 or day == 5) then
		tbl = {9,9,8,9,8,8,8,8,9,9,9,8,9,8,8,8,8,9};
	elseif(day == 0 or day == 4) then
		tbl = {8,9,8,9,8,9,9,8,9,9,8,8,9,8,8,8,8,9};
	else
		tbl = {9,8,9,9,8,9,8,8,9,8,8,9,8,9,8,9,8,8};
	end
	
	GetNPCByID(SacrariumWallOffset):setAnimation(tbl[1]);
	GetNPCByID(SacrariumWallOffset+6):setAnimation(tbl[2]);
	GetNPCByID(SacrariumWallOffset+12):setAnimation(tbl[3]);
	GetNPCByID(SacrariumWallOffset+13):setAnimation(tbl[4]);
	GetNPCByID(SacrariumWallOffset+1):setAnimation(tbl[5]);
	GetNPCByID(SacrariumWallOffset+7):setAnimation(tbl[6]);
	GetNPCByID(SacrariumWallOffset+14):setAnimation(tbl[7]);
	GetNPCByID(SacrariumWallOffset+2):setAnimation(tbl[8]);
	GetNPCByID(SacrariumWallOffset+8):setAnimation(tbl[9]);
	GetNPCByID(SacrariumWallOffset+9):setAnimation(tbl[10]);
	GetNPCByID(SacrariumWallOffset+3):setAnimation(tbl[11]);
	GetNPCByID(SacrariumWallOffset+15):setAnimation(tbl[12]);
	GetNPCByID(SacrariumWallOffset+16):setAnimation(tbl[13]);
	GetNPCByID(SacrariumWallOffset+10):setAnimation(tbl[14]);
	GetNPCByID(SacrariumWallOffset+4):setAnimation(tbl[15]);
	GetNPCByID(SacrariumWallOffset+17):setAnimation(tbl[16]);
	GetNPCByID(SacrariumWallOffset+11):setAnimation(tbl[17]);
	GetNPCByID(SacrariumWallOffset+5):setAnimation(tbl[18]); 
	
	-- Ro'Maeve Moongates
	local Moongate_Offset = 17277173; -- _3e0 in npc_list
	local direction = VanadielMoonDirection();
	local phase = VanadielMoonPhase();
	
	if(((direction == 2 and phase >= 90) or (direction == 1 and phase >= 95)) and GetNPCByID(Moongate_Offset):getWeather() == 0) then
		GetNPCByID(Moongate_Offset):openDoor(432);
		GetNPCByID(Moongate_Offset+1):openDoor(432);
	end
	
	-- Removes daily the bit mask that tracks the treats traded for Harvest Festival.
	if (isHalloweenEnabled() ~= 0) then
		clearVarFromAll("harvestFestTreats");
		clearVarFromAll("harvestFestTreats2");
	end
	
end;

function OnGameHourAutomatisation()

	local VanadielHour = VanadielHour();
	local FlameSpout = 17617199;
	
	-- Community Service Quest
	if(VanadielHour == 1) then
		if(GetServerVariable("[JEUNO]CommService") == 0) then
			GetNPCByID(17780880):setStatus(0); -- Vhana Ehgaklywha
			GetNPCByID(17780880):initNpcAi();
		end;
		
	elseif(VanadielHour == 5) then
		SetServerVariable("[JEUNO]CommService",0);
		
	end
	GetNPCByID(16806282):openDoor(); -- Attohwa Chasm miasma
	
	if(VanadielHour % 3 == 0) then -- Opens flame spouts every 3 hours Vana'diel time
		GetNPCByID(FlameSpout):openDoor(90); -- Ifrit's Cauldron flame spout (H-6) Map 1
		GetNPCByID(FlameSpout+1):openDoor(90); -- Ifrit's Cauldron flame spout (H-6) Map 5
		GetNPCByID(FlameSpout+2):openDoor(90); -- Ifrit's Cauldron flame spout (I-10) Map 8
		GetNPCByID(FlameSpout+3):openDoor(90); -- Ifrit's Cauldron flame spout (E-7) Map 8
	end
	
end;