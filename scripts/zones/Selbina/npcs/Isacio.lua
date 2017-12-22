-----------------------------------
-- Area: Selbina
-- NPC: Isacio
-- Finishes Quest: Elder Memories
-- !pos -54 -1 -44 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local questStatus = player:getQuestStatus(OTHER_AREAS,ELDER_MEMORIES);

    if (questStatus == QUEST_ACCEPTED and trade:getItemCount() == 1) then
        local IsacioElderMemVar = player:getVar("IsacioElderMemVar");
        if (IsacioElderMemVar == 1 and trade:hasItemQty(538,1)) then
            player:startEvent(115,537);
        elseif (IsacioElderMemVar == 2 and trade:hasItemQty(537,1)) then
            player:startEvent(116,539);
        elseif (IsacioElderMemVar == 3 and trade:hasItemQty(539,1)) then
            player:startEvent(117);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local questStatus = player:getQuestStatus(OTHER_AREAS, ELDER_MEMORIES);

    if (player:getQuestStatus(OTHER_AREAS, THE_OLD_LADY) ~= QUEST_AVAILABLE) then
        player:startEvent(99);
    elseif (questStatus == QUEST_COMPLETED) then
        player:startEvent(118);
    elseif (questStatus == QUEST_ACCEPTED) then
        IsacioElderMemVar = player:getVar("IsacioElderMemVar");
        if (IsacioElderMemVar == 1) then
            player:startEvent(114,538);
        elseif (IsacioElderMemVar == 2) then
            player:startEvent(114,537);
        elseif (IsacioElderMemVar == 3) then
            player:startEvent(114,539);
        end
    else
        if (player:getMainLvl() >= SUBJOB_QUEST_LEVEL) then
            player:startEvent(111,538);
        else
            player:startEvent(119);
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

    if (csid == 111 and option == 40) then
        player:addQuest(OTHER_AREAS, ELDER_MEMORIES);
        player:setVar("IsacioElderMemVar", 1);
    elseif (csid == 115) then
        player:tradeComplete();
        player:setVar("IsacioElderMemVar", 2);
    elseif (csid == 116) then
        player:tradeComplete();
        player:setVar("IsacioElderMemVar", 3);
    elseif (csid == 117) then
        player:tradeComplete();
        player:unlockJob(0);
        player:setVar("IsacioElderMemVar", 0);
        player:messageSpecial(SUBJOB_UNLOCKED);
        player:completeQuest(OTHER_AREAS, ELDER_MEMORIES);
    end

end;