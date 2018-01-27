-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ahkk Jharcham
-- Quest 'Keeping Notes'
-- !pos 0.1 -1 -76 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local keepingNotes = player:getQuestStatus(AHT_URHGAN,KEEPING_NOTES);
    local sheetOfParchment = trade:hasItemQty(917,1);
    local jarOfBlackInk = trade:hasItemQty(929,1);

    if (keepingNotes == QUEST_ACCEPTED and sheetOfParchment and jarOfBlackInk and trade:getItemCount() == 2) then
        player:startEvent(11);
    elseif (keepingNotes == QUEST_COMPLETED and sheetOfParchment and trade:getItemCount() == 1) then
        player:startEvent(13);
    end

end;

function onTrigger(player,npc)

    local keepingNotes = player:getQuestStatus(AHT_URHGAN,KEEPING_NOTES);

    if (keepingNotes == QUEST_AVAILABLE) then
        player:startEvent(9);
    elseif (keepingNotes == QUEST_ACCEPTED) then
        player:startEvent(14);
    elseif (keepingNotes == QUEST_COMPLETED) then
        player:startEvent(12);
    else
        player:startEvent(10);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 9) then
        player:addQuest(AHT_URHGAN,KEEPING_NOTES);
    elseif (csid == 11) then
        player:moghouseFlag(16);
        player:completeQuest(AHT_URHGAN,KEEPING_NOTES);
    end

end;