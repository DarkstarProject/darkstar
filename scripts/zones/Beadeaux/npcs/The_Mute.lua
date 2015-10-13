-----------------------------------
-- Area: Beadeaux
-- NPC:  ???
-- @pos -166.230 -1 -73.685 147
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
	local duration = math.random(600,900);

	if (player:getQuestStatus(BASTOK,THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getVar("cCollectSilence") == 0) then
		player:setVar("cCollectSilence",1);
	end

	player:addStatusEffect(EFFECT_SILENCE,0,0,duration);

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