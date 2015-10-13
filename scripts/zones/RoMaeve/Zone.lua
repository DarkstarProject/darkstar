-----------------------------------
--
-- Zone: RoMaeve (122)
--
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17277227,17277228};
    
    SetFieldManual(manuals);
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
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-0.008,-33.595,123.478,62);
	end	
    if (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x0003; -- doll telling "you're in the right area"
    end
	return cs;	
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
	
	-- Moongates
	local Moongate_Offset = 17277195; -- _3e0 in npc_list
	local direction = VanadielMoonDirection();
	local phase = VanadielMoonPhase();
	
	if (((direction == 2 and phase >= 90) or (direction == 1 and phase >= 95)) and GetNPCByID(Moongate_Offset):getWeather() == 0) then
		GetNPCByID(Moongate_Offset):openDoor(432);
		GetNPCByID(Moongate_Offset+1):openDoor(432);
	end
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
end;	
