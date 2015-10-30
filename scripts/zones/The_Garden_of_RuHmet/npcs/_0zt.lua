-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  Luminus convergence
-----------------------------------

package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;

-----------------------------------


require("scripts/globals/settings");
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
 
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==5) then
	   player:startEvent(0x00CC);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
   if (csid==0x00CC) then
   	   	player:completeMission(COP,WHEN_ANGELS_FALL);
	    player:addMission(COP,DAWN);
      player:setVar("PromathiaStatus",0);
   end
end;