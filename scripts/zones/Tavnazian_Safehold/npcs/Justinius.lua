-----------------------------------
-- Area: Tavnazian Safehold
-- NPC:  Justinius
-- Involved in mission : COP2-3
-- @pos 76 -34 68 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 3) then
		player:startEvent(0x0071);
	elseif (player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 2) then	
	    player:startEvent(0x006D);
	elseif (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 2) then 	
	    player:startEvent(0x006E);
	else
		player:startEvent(0x007B);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x0071) then
		player:setVar("PromathiaStatus",0);
		player:completeMission(COP,DISTANT_BELIEFS);
		player:addMission(COP,AN_ETERNAL_MELODY);
	elseif (csid == 0x006D) then
		player:setVar("PromathiaStatus",3);
	elseif (csid == 0x006E) then
		player:setVar("PromathiaStatus",0);	
		player:completeMission(COP,THE_SAVAGE);
		player:addMission(COP,THE_SECRETS_OF_WORSHIP);
		player:addTitle(NAGMOLADAS_UNDERLING);
	end
	
end;