-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Pherimociel
-- Involved in mission: COP 1-2
-- @pos -31.627 1.002 67.956 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
  	
	if(player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 0) then
		player:startEvent(0x0018);
	elseif(player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
		player:startEvent(0x0019);
	elseif(player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 3) then	
	    player:startEvent(0x003A);
	else
		player:startEvent(0x009b);
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

	if(csid == 0x0018) then
		player:setVar("PromathiaStatus",1); -- first cs mission 1.2 has been seen YOU CAN NOW ENTER TO PROMYVION
		player:setVar("FirstPromyvionHolla",1);
		player:setVar("FirstPromyvionMea",1);
		player:setVar("FirstPromyvionDem",1);
	elseif(csid == 0x003A) then	
	    player:setVar("COP_Tenzen_s_Path",4);
	end
	
end;