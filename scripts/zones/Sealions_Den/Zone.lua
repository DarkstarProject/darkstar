-----------------------------------
--
-- Zone: Sealions_Den (32)
--
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Sealions_Den/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
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
		player:setPos(600.101,130.355,797.612,50);
	end	
	if (player:getCurrentMission(COP) == ONE_TO_BE_FEARED and player:getVar("PromathiaStatus")==1) then
	  cs=0x000F;
	elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus")==2) then
	  cs=0x000E;
	end
	return cs;	
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
	if (csid == 0x000F) then
	   player:setVar("PromathiaStatus",2);
	elseif (csid == 0x000E) then  
	   player:setVar("PromathiaStatus",3);
	end
end;	
