-----------------------------------
--  Area: Northern San d'Oria
--  NPC:  Arnau
--  Involved in Mission: Save the Children
--  @zone 231
--  @pos 148 0 139
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and player:getVar("saveTheChildrenMissionCS") < 3) then
		player:startEvent(0x02b5);
		player:setVar("saveTheChildrenMissionCS",3);
	elseif(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) and player:getVar("saveTheChildrenMissionCS") == 6) then
		player:setVar("saveTheChildrenMissionCS",0);
	else
		player:startEvent(0x0014);
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
end;