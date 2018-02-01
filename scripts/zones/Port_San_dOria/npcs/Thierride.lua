-----------------------------------
-- Area: Port San d'Oria
--   NPC: Thierride
-- Type: Quest Giver
-- @zone 232
-- !pos -67 -5 -28
--
-- Starts and Finishes Quest: A Taste For Meat
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();

    if (trade:hasItemQty(4358, 5) and count == 5) then
        if (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_ACCEPTED) then
            player:startEvent(528);
        else
            player:startEvent(526);
        end
    elseif (player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM) == QUEST_ACCEPTED and trade:hasItemQty(595,1) == true and count == 1) then
        player:tradeComplete();
        player:startEvent(539);
        player:setVar("TheBrugaireConsortium-Parcels", 31);
    else
        player:startEvent(529);
    end

end;

function onTrigger(player,npc)

    aTasteForMeat = player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT);
    if (aTasteForMeat == QUEST_AVAILABLE and player:getVar("aTasteForMeat") == 1 or aTasteForMeat == QUEST_ACCEPTED) then
        player:startEvent(526);
    else
        player:startEvent(524);
    end;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 526) then
        if (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_AVAILABLE) then
            player:setVar("aTasteForMeat", 0);
            player:addQuest(SANDORIA, A_TASTE_FOR_MEAT);
        end;
    elseif (csid == 528) then
        player:tradeComplete();
        player:setVar("aTasteForMeat", 1);
        player:addFame(SANDORIA, 30);
        player:addGil(GIL_RATE*150);
        player:messageSpecial(GIL_OBTAINED, GIL_RATE*150);
        player:completeQuest(SANDORIA, A_TASTE_FOR_MEAT);
        player:addTitle(RABBITER);
    end;

end;
