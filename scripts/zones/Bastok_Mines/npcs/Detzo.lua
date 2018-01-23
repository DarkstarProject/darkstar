-----------------------------------
-- Area: Bastok Mines
--  NPC: Detzo
-- Starts & Finishes Quest: Rivals
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    Rivals = player:getQuestStatus(BASTOK,RIVALS);

    if (Rivals == QUEST_ACCEPTED) then
        FreeSlots = player:getFreeSlotsCount();

        if (FreeSlots >= 1) then
            count = trade:getItemCount();
            MythrilSallet = trade:hasItemQty(12417,1);

            if (MythrilSallet == true and count == 1) then
                -- You retain the Mythril Sallet after trading it to Detzo
                player:startEvent(94);
            end
        else
            player:messageSpecial(FULL_INVENTORY_AFTER_TRADE, 13571);
        end
    end

end;

function onTrigger(player,npc)

    Rivals = player:getQuestStatus(BASTOK,RIVALS);

    if (player:getVar("theTalekeeperGiftCS") == 1) then
        player:startEvent(171);
        player:setVar("theTalekeeperGiftCS",2);
    elseif (Rivals == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 3) then
        player:startEvent(93);
    elseif (Rivals == QUEST_ACCEPTED) then
        player:showText(npc,10311);
    else
        player:startEvent(30);
    end

end;
-- 0x0001  30  93  94  171  0x03f2  0x00b0  0x00b4  0x00b8
function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 93) then
        player:addQuest(BASTOK,RIVALS);
    elseif (csid == 94) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13571);
        else
            player:addTitle(CONTEST_RIGGER);
            player:addItem(13571);
            player:messageSpecial(ITEM_OBTAINED,13571);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,RIVALS);
        end
    end

end;
