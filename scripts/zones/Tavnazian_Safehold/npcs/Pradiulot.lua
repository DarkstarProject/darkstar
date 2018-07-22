-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Pradiulot
-- Involved in Quest: Unforgiven
-- !pos -20.814 -22 8.399 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
require("scripts/globals/keyitems")
require("scripts/globals/quests");
-----------------------------------
-- For those who don't know
-- at the end of if (player:getQuestStatus(REGION,QUEST_NAME)
-- == 0 means QUEST_AVAILABLE
-- == 1 means QUEST_ACCEPTED
-- == 2 means QUEST_COMPLETED
-- e.g. if (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == 0
-- means if (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == QUEST AVAILABLE

function onTrade(player,npc,trade)

if (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == 2 and trade:getGil() == 1 == true) then
        player:startEvent(206); -- Dialogue after completing quest (optional)
        end

end;

function onTrigger(player,npc)

local Unforgiven = player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN);

if (Unforgiven == 1 and player:getVar("UnforgivenVar") == 1) then
    player:startEvent(204); -- Dialogue for final stage of Unforgiven Quest

elseif (player:getQuestStatus(OTHER_AREAS_LOG,UNFORGIVEN) == 2 and player:getVar("UnforgivenVar") == 2) then
    player:startEvent(206); -- Dialogue after completing quest (optional)

else
    player:startEvent(371); -- Default Dialogue
end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
if (csid == 204) then
    player:setVar("UnforgivenVar",2);
    player:addKeyItem(dsp.ki.MAP_OF_TAVNAZIA)
    player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAP_OF_TAVNAZIA); -- Map of Tavnazia
    player:completeQuest(OTHER_AREAS_LOG,UNFORGIVEN);

elseif (csid == 206) then
    player:setVar("UnforgivenVar",0);

    end
end;

