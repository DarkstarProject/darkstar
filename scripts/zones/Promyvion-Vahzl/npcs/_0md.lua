-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Memory flux (2)
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==3) then
		SpawnMob(16867333,240):updateClaim(player);
	elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==4) then
		player:startEvent(0x0034);   
	else
		player:messageSpecial(OVERFLOWING_MEMORIES);
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
    if (csid == 0x0034) then
	  player:setVar("PromathiaStatus",5);
	end
end;