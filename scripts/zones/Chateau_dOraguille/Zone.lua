-----------------------------------
--
-- Zone: Chateau_dOraguille (233)
--
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
cs = -1;
	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(14.872,8.918,24.002,255);
	end
	
	if(prevZone == 231 and player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 2) then	
		cs = 0x022b;
elseif(player:getCurrentMission(SANDORIA) == THE_HEIR_TO_THE_LIGHT and player:getVar("SANDO92") == 1)then
cs = 0x000a;
	elseif(prevZone == 231 and player:hasKeyItem(MESSAGE_TO_JEUNO_SANDORIA)) then
		cs = 0x01FD;
	elseif(player:getVar("SecretWeaponStatus") == 1) then
		cs = 0x0000;
	elseif(player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 0) then
		cs = 0x0074;
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
	
	if(csid == 0x022b) then	
		player:setVar("MissionStatus",3);
	elseif(csid == 0x01FD) then
		player:setVar("MissionStatus",9);
		player:delKeyItem(MESSAGE_TO_JEUNO_SANDORIA);
	elseif(csid == 0) then
		player:setVar("SecretWeaponStatus",2)
	elseif(csid == 0x000a) then
		player:setVar("SANDO92",2)
	elseif(csid == 0x0074) then
		player:setVar("MissionStatus",1)
	end
	
end;		
