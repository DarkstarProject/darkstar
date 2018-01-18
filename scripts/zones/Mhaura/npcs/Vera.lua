-----------------------------------
-- Area: Mhaura
-- NPC: Vera
-- Finishes Quest: The Old Lady
-- !pos -49 -5 20 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local questStatus = player:getQuestStatus(OTHER_AREAS,THE_OLD_LADY);

    if (questStatus == QUEST_ACCEPTED and trade:getItemCount() == 1) then
        local VeraOldLadyVar = player:getVar("VeraOldLadyVar");
        if (VeraOldLadyVar == 1 and trade:hasItemQty(542,1)) then
            player:startEvent(135,541);
        elseif (VeraOldLadyVar == 2 and trade:hasItemQty(541,1)) then
            player:startEvent(136,540);
        elseif (VeraOldLadyVar == 3 and trade:hasItemQty(540,1)) then
            player:startEvent(137);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local questStatus = player:getQuestStatus(OTHER_AREAS, THE_OLD_LADY);

    if (player:getQuestStatus(OTHER_AREAS, ELDER_MEMORIES) ~= QUEST_AVAILABLE) then
        player:startEvent(130);
    elseif (questStatus == QUEST_COMPLETED) then
        player:startEvent(138);
    elseif (questStatus == QUEST_ACCEPTED) then
        VeraOldLadyVar = player:getVar("VeraOldLadyVar");
        if (VeraOldLadyVar == 1) then
            player:startEvent(132,542);
        elseif (VeraOldLadyVar == 2) then
            player:startEvent(132,541);
        elseif (VeraOldLadyVar == 3) then
            player:startEvent(132,540);
        end
    else
        if (player:getMainLvl() >= SUBJOB_QUEST_LEVEL) then
            player:startEvent(131,542);
        else
            player:startEvent(133);
        end
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 131 and option == 40) then
        player:addQuest(OTHER_AREAS, THE_OLD_LADY);
        player:setVar("VeraOldLadyVar", 1);
    elseif (csid == 135) then
        player:tradeComplete();
        player:setVar("VeraOldLadyVar", 2);
    elseif (csid == 136) then
        player:tradeComplete();
        player:setVar("VeraOldLadyVar", 3);
    elseif (csid == 137) then
        player:tradeComplete();
        player:unlockJob(0);
        player:setVar("VeraOldLadyVar", 0);
        player:messageSpecial(SUBJOB_UNLOCKED);
        player:completeQuest(OTHER_AREAS,THE_OLD_LADY);
    end

end;