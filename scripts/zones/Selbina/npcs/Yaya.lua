-----------------------------------
-- Area: Selbina
-- NPC: Yaya
-- Starts Quest: Under the sea
-- @pos -19 -2 -16 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getFameLevel(SELBINA) >= 2 and player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_AVAILABLE) then 
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
    if (csid == 0x001f) then 
        player:addQuest(OTHER_AREAS,UNDER_THE_SEA);
        player:setVar("underTheSeaVar",1);
    end
end;



