-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Secodiand
-- Starts and Finishes Quest: Fear of the dark
-- @zone 231
-- !pos -160 -0 137
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
--
    if (player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(922,2) and trade:getItemCount() == 2) then
            player:startEvent(18);
        end
    end
--]]
end;

function onTrigger(player,npc)

 FearOfTheDark = player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK);

    if (FearOfTheDark == QUEST_AVAILABLE) then
        player:startEvent(19);
    else
        player:startEvent(17);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
--
    if (csid == 19 and option == 1) then
        player:addQuest(SANDORIA,FEAR_OF_THE_DARK);
    elseif (csid == 18) then
        player:tradeComplete();
        player:addGil(GIL_RATE*200);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
        if (player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,FEAR_OF_THE_DARK);
        else
            player:addFame(SANDORIA,5);
        end
    end
--]]
end;