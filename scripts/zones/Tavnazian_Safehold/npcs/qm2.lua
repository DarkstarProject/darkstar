-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: ???
-- Involved in Quest: Unforgiven
-- !pos 110.714 -40.856 -53.154 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
-----------------------------------
-- For those who don't know
-- at the end of if (player:getQuestStatus(REGION,QUEST_NAME)
-- == 0 means QUEST_AVAILABLE
-- == 1 means QUEST_ACCEPTED
-- == 2 means QUEST_COMPLETED
-- e.g. if (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == 0
-- means if (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == QUEST AVAILABLE

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

local Unforgiven = player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN);

    if (Unforgiven == 1 and player:hasKeyItem(dsp.ki.ALABASTER_HAIRPIN) == false) then
        player:addKeyItem(dsp.ki.ALABASTER_HAIRPIN);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ALABASTER_HAIRPIN) -- ALABASTER HAIRPIN for Unforgiven Quest

    end
end

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

end