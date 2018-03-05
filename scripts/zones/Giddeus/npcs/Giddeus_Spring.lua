-----------------------------------
-- Area: Giddeus
--  NPC: Giddeus Spring
-- Involved in Quest "Water Way to Go"
-- !pos -258 -2 -249
-- @zone 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Giddeus/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(504,1) and trade:getItemCount() == 1) then
            player:startEvent(55);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(54);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 55) then
        player:tradeComplete();
        player:addItem(4351);
        player:messageSpecial(ITEM_OBTAINED,4351);
    end
end;

