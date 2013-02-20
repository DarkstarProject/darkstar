-----------------------------------
-- Area: Beadeaux
-- NPC:  ???
-- @zone 147
-- @pos -160, -145, 1
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(BASTOK,THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getVar("cCollectCurse") == 0) then 
		player:setVar("cCollectCurse",1);
	end
	if (player:hasStatusEffect(EFFECT_CURSE_I) == false) then
		player:addStatusEffect(EFFECT_CURSE_I,0,0,300);
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
end;