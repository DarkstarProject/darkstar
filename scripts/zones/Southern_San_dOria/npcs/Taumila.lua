-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Taumila
-- Starts and Finishes Quest: Tiger's Teeth (R)
-- !pos -140 -5 -8 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,TIGER_S_TEETH) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(884,3) and trade:getItemCount() == 3) then
            player:startEvent(572);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local tigersTeeth = player:getQuestStatus(SANDORIA,TIGER_S_TEETH);

    if (player:getFameLevel(SANDORIA) >= 3 and tigersTeeth == QUEST_AVAILABLE) then
        player:startEvent(574);
    elseif (tigersTeeth == QUEST_ACCEPTED) then
        player:startEvent(575);
    elseif (tigersTeeth == QUEST_COMPLETED) then
        player:startEvent(573);
    else
        player:startEvent(571);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 574 and option == 0) then
        player:addQuest(SANDORIA,TIGER_S_TEETH);
    elseif (csid == 572) then
        player:tradeComplete();
        player:addTitle(FANG_FINDER);
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100)
        if (player:getQuestStatus(SANDORIA,TIGER_S_TEETH) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,TIGER_S_TEETH);
        else
            player:addFame(SANDORIA,5);
        end
    end

end;