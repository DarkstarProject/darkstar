-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Signpost
-- Involved in Quest: The Signpost Marks the Spot
-- @pos -183 65 599 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local SignPost = player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
    local Painting = player:hasKeyItem(PAINTING_OF_A_WINDMILL);

    if (SignPost == 1 and Painting == false) then
        player:messageSpecial(SIGNPOST_DIALOG_2);
        player:addKeyItem(PAINTING_OF_A_WINDMILL);
        player:messageSpecial(KEYITEM_OBTAINED,PAINTING_OF_A_WINDMILL);
    else
        player:messageSpecial(SIGNPOST_DIALOG_1);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;