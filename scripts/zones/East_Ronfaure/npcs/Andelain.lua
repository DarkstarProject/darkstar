-----------------------------------
-- Area: East Ronfaure
--  NPC: Andelain
-- Type: Standard NPC
-- !pos 664.231 -12.849 -539.413 101
--  Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/East_Ronfaure/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    sermonQuest = player:getQuestStatus(SANDORIA,THE_VICASQUE_S_SERMON);

    if (sermonQuest == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        BluePeas = trade:getItemQty(618);
        if (BluePeas == 1 and count == 1 and player:getVar("sermonQuestVar") == 0) then
            player:tradeComplete();
            player:showText(npc, 7349);
            player:startEvent(19);
            player:setVar("sermonQuestVar",1);
        elseif (BluePeas > 1 and count == BluePeas) then
            player:showText(npc, 7352);
            player:startEvent(19);
        elseif (BluePeas == 1 and count == 1) then
            player:showText(npc, 7352,618);
            player:startEvent(19);
        else
            player:showText(npc, 7350);
            player:showText(npc, 7351);
            player:startEvent(19);
        end
    else
        player:showText(npc, 7350);
        player:showText(npc, 7351);
        player:startEvent(19);
    end
end;

function onTrigger(player,npc)
    player:showText(npc, 7347);
    player:showText(npc, 7348,618);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

