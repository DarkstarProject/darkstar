-----------------------------------
-- Area: Upper Jeuno
-- NPC: Marble Bridge Eatery
-- 
-- @zone 244
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	
	if(player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 1) then 
      player:startEvent(0x271B);
	elseif(player:getCurrentMission(COP) ==FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus")==3)then
	  player:startEvent(0x271C);
	end
	return -1;
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
	if(csid ==  0x271B) then 
       player:setVar("PromathiaStatus",2);
	elseif(csid ==  0x271C) then  
	   player:setVar("PromathiaStatus",0);
	   player:completeMission(COP,FLAMES_IN_THE_DARKNESS);
	   player:addMission(COP,FIRE_IN_THE_EYES_OF_MEN);
	end
end;



