-----------------------------------
-- Area: Bastok Markets
--  NPC: Nbu Latteh
-- Starts & Finishes Quest: Mom, The Adventurer?
-- Starts Quest: The Signpost Marks the Spot
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local pFame = player:getFameLevel(BASTOK);
    local momTheAdventurer = player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER);
    local questStatus = player:getVar("MomTheAdventurer_Event");

    if (player:needToZone()) then
        player:startEvent(127); -- chat about my work
    elseif (pFame < 2 and momTheAdventurer ~= QUEST_ACCEPTED and questStatus == 0) then
        player:startEvent(230);
    elseif (momTheAdventurer >= QUEST_ACCEPTED and questStatus == 2) then
        if (player:seenKeyItem(LETTER_FROM_ROH_LATTEH)) then
            player:startEvent(234);
        elseif (player:hasKeyItem(LETTER_FROM_ROH_LATTEH)) then
            player:startEvent(233);
        else
            player:startEvent(231);
        end
    elseif (pFame >= 2 and player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT) == QUEST_AVAILABLE) then
        player:startEvent(235);
    else
        player:startEvent(127);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 230 and option == 0) then
        if (player:getFreeSlotsCount(0) > 0) then
            player:setVar("MomTheAdventurer_Event",1);
            player:addItem(4096);
            player:messageSpecial(ITEM_OBTAINED,4096); -- Fire Crystal
            if (player:questStatus(BASTOK,MOM_THE_ADVENTURER == QUEST_AVAILABLE)) then
                player:addQuest(BASTOK,MOM_THE_ADVENTURER);
            end
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4096);
        end
    elseif (csid == 233 or csid == 234) then
        if (player:seenKeyItem(LETTER_FROM_ROH_LATTEH)) then
            gilReward = 100;
        else
            gilReward = 200;
        end
        player:needToZone(true);
        player:delKeyItem(LETTER_FROM_ROH_LATTEH);
        player:addTitle(RINGBEARER);
        player:addGil(GIL_RATE*gilReward);
        player:messageSpecial(GIL_OBTAINED, GIL_RATE*gilReward);
        player:setVar("MomTheAdventurer_Event",0);

        if (player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER) == QUEST_ACCEPTED) then
            player:addFame(BASTOK,20);
            player:completeQuest(BASTOK,MOM_THE_ADVENTURER);
        else
            player:addFame(BASTOK,8)
        end
    elseif (csid == 235 and option == 0) then
        player:addQuest(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
        player:setVar("MomTheAdventurer_Event",0);
    end

end;