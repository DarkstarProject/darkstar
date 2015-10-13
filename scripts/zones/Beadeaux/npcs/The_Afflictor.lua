-----------------------------------
-- Area: Beadeaux
-- NPC:  The Afflictor
-- @zone 147
-- @pos <many>
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
	
	if (player:getQuestStatus(BASTOK,THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getVar("cCollectCurse") == 0) then 
		player:setVar("cCollectCurse",1);
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