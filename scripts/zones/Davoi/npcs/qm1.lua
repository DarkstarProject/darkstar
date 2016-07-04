-----------------------------------
-- Area: Davoi
-- NPC:  ??? (qm1)
-- Involved in Quest: To Cure a Cough
-- @pos -115.830 -0.427 -184.289 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
    
    if (toCureaCough == QUEST_ACCEPTED and player:hasKeyItem(THYME_MOSS) == false) then
        player:addKeyItem(THYME_MOSS);
        player:messageSpecial(KEYITEM_OBTAINED,THYME_MOSS);
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
