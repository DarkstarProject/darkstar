-----------------------------------
-- Area: Selbina
-- NPC: Yaya
-- Starts Quest: Under the sea
-- @zone 248
-- @pos -19 -2 -16
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	SelbiFame = math.floor((player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2); -- Selbina Fame
	
	if(SelbiFame >= 2 and player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_AVAILABLE) then 
		player:startEvent(0x001f); -- Start quest "Under the sea"
	else
		player:startEvent(0x0099); -- Standard dialog
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
	if(csid == 0x001f) then 
		player:addQuest(OTHER_AREAS,UNDER_THE_SEA);
		player:setVar("underTheSeaVar",1);
	end
end;



