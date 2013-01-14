-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC: ornate door
-- @pos -95 -24 60 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	if(player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 2)then
        player:startEvent(0x0024);
    else
		return -1;
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
	
	if(csid == 0x0024) then
		player:setVar("PromathiaStatus",3);
	end
	
end;