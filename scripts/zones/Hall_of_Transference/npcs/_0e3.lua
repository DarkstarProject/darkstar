-----------------------------------
-- Area: Hall of Transference
-- NPC:  Large Apparatus - Holla
-- @pos -239 -1 290 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("/scripts/globals/missions");
require("/scripts/globals/teleports");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2) then
		player:startEvent(0x00A0); 
	-- elseif (x) then
	-- 	player:startEvent(x); -- To sky		
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

	if(csid == 0x00A0) then
		player:setPos(92.033, 0, 80.380, 255, 16); -- To Promyvion Holla {R}
	-- elseif (csid == x and option == 1) then
	-- 	toSkyGreenPorterLeft(player);
	end
end;