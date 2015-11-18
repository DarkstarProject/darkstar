-----------------------------------
--
-- Zone: Ordelles_Caves (193)
--
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Ordelles_Caves/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17568200,17568201};
    
    SetGroundsTome(tomes);
    
    -- Morbolger
    SetRespawnTime(17568127, 900, 10800);

    UpdateTreasureSpawnPoint(17568188);
    
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-76.839,-1.696,659.969,122);
	end	
	if (prevZone == 102 and player:getVar("darkPuppetCS") == 1) then	
		cs = 0x000a;
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
	if (csid == 0x000a) then	
		player:setVar("darkPuppetCS",2);
	end	
end;		
