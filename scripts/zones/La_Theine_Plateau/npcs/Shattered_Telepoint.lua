-----------------------------------
-- Area: La_Theine_Plateau
-- NPC:  Shattered telepoint
-- @pos 334 19 -60 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
	if(player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
		player:setVar("Stelepoint",3); -- promyvion holla
		player:startEvent(0x00C9);  
	elseif(player:getCurrentMission(COP) > BELOW_THE_ARKS)then
		player:setVar("Stelepoint",3); -- promyvion holla
		player:startEvent(0x0074);
	else
		player:messageSpecial(TELEPOINT_HAS_BEEN_SHATTERED);
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
	
	if(csid == 0x00C9) then
		player:setVar("PromathiaStatus",2);
		player:setPos(274 ,-82 ,-62 ,180 ,14); -- teleport to zone 14
	elseif(csid == 0x0074) then 
		player:setPos(274 ,-82 ,-62 ,180 ,14); -- teleport to zone 14 
	end
	   
end;

