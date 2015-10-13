-----------------------------------
--
-- Zone: Davoi (149)
--
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(17388023);
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(282.292,2.498,-17.908,247);
	end	
	if (player:getCurrentMission(SANDORIA) == INFILTRATE_DAVOI and player:getVar("MissionStatus") == 2) then	
		cs = 0x0074;
	end	
	if (player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_ACCEPTED and GetMobAction(17387969) == 0) then	
		SpawnMob(17387969); -- Spawned by Quest: The Crimson Trial upon entering the zone.
	end	
	return cs;	
end;		

-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)		
end;		

-----------------------------------		
-- onGameDay		
-----------------------------------		

function onGameDay()
	
	-- Storage Hole
	local storHolePos = {--[[E-10]]{-177.925,4.000,-255.699},--[[F-6]]{-127.703,4.250,23.732}, --[[F-7]]{-127.822,4.250,-16.964},--[[F-9]]{-123.369,4.000,-231.972},--[[G-9]]{-51.570,4.127,-216.462},
						 --[[G-10]]{-55.960,2.958,-300.014}, --[[I-7]]{152.311,4.000,-74.176}, --[[I-8]]{153.514,4.250,-112.616},--[[J-7]]{188.988,4.000,-80.058},  --[[K-7]]{318.694,0.001,-58.646},
						 --[[K-8]]{299.717,0.001,-160.910},  --[[K-9]]{274.849,4.162,-213.599},--[[K-9]]{250.809,4.000,-240.509},--[[J-8]]{219.474,3.750,-128.170}, --[[I-9]]{86.749,-5.166,-166.414}};
	
	local storageHole = GetNPCByID(17388021);
	local randPos = 0;
	
	while(randPos == 0 or storHolePos[randPos][1] == storageHole:getXPos()) do
		randPos = math.random(1,15);
	end
	
	storageHole:setPos(storHolePos[randPos][1],storHolePos[randPos][2],storHolePos[randPos][3],0);
end;

-----------------------------------		
-- onEventUpdate		
-----------------------------------		

function onEventUpdate(player,csid,option)		
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);	
end;		

-----------------------------------		
-- onEventFinish		
-----------------------------------		

function onEventFinish(player,csid,option)		
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);	
	if (csid == 0x0074) then	
		player:setVar("MissionStatus",3);
	end	
end;		
