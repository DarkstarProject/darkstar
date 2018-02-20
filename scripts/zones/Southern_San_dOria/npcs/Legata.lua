-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Legata
-- Starts and Finishes Quest: Starting a Flame (R)
-- @zone 230
-- !pos 82 0 116
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(768,4) and trade:getItemCount() == 4) then
            player:startEvent(36);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) == QUEST_AVAILABLE) then
        player:startEvent(37);
    else
        player:startEvent(35);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 37 and option == 1) then
        player:addQuest(SANDORIA,STARTING_A_FLAME);
    elseif (csid == 36) then
        player:tradeComplete();
        player:addGil(GIL_RATE*100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*100);
        if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,STARTING_A_FLAME);
        else
            player:addFame(SANDORIA,5);
        end
    end

end;