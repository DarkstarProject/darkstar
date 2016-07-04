-----------------------------------
--    Area: Windurst Waters
--    NPC:  Paku-Nakku
--  Involved in Quest: Making the Grade
--    Working 100% 
--  @zone = 238
--  @pos = 127 -6 165
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        player:startEvent(0x01c4); -- During Making the GRADE
    else
        player:startEvent(0x01af);  -- Standard conversation
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



