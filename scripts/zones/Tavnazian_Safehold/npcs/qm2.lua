-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: ???
-- Involved in Quest: Unforgiven
-- @zone 26
-- @pos 110.714 -40.856 -53.154
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/zones/Tavnazian_Safehold/TextIDs")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
-----------------------------------
-- For those who don't know
-- at the end of if (player:getQuestStatus(REGION,QUEST_NAME)
-- == 0 means QUEST_AVAILABLE
-- == 1 means QUEST_ACCEPTED
-- == 2 means QUEST_COMPLETED 
-- e.g. if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == 0 
-- means if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == QUEST AVAILABLE

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local Unforgiven = player:getQuestStatus(OTHER_AREAS,UNFORGIVEN);

    if (Unforgiven == 1 and player:hasKeyItem(609) == false) then
        player:addKeyItem(609);
        player:messageSpecial(KEYITEM_OBTAINED,609) -- ALABASTER HAIRPIN for Unforgiven Quest

    end
end
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

end