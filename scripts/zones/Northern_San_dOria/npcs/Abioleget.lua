-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Abioleget
-- Type: Quest Giver (Her Memories: The Faux Pas and The Vicasque's Sermon) / Merchant
--  @zone 231
-- !pos 128.771 0.000 118.538
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (sermonQuest == QUEST_ACCEPTED) then
        gil = trade:getGil();
        count = trade:getItemCount();
        if (gil == 70 and count == 1) then
            player:tradeComplete();
            player:startEvent(591);
        end
    end
end;

function onTrigger(player,npc)
    sermonQuest = player:getQuestStatus(SANDORIA,THE_VICASQUE_S_SERMON);

    if (sermonQuest == QUEST_AVAILABLE) then
        player:startEvent(589);
    elseif (sermonQuest == QUEST_ACCEPTED) then
        if (player:getVar("sermonQuestVar") == 1) then
            player:tradeComplete();
            player:startEvent(600);
        else
            player:showText(npc,11103,618,70);
        end
    else
        player:showText(npc,ABIOLEGET_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 600) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13465);
        else
            player:addItem(13465);
            player:messageSpecial(ITEM_OBTAINED, 13465);
            player:addFame(SANDORIA,30);
            player:addTitle(THE_BENEVOLENT_ONE);
            player:setVar("sermonQuestVar",0);
            player:completeQuest(SANDORIA,THE_VICASQUE_S_SERMON );
        end
    elseif (csid == 589) then
        player:addQuest(SANDORIA,THE_VICASQUE_S_SERMON );
    elseif (csid == 591) then
        player:addItem(618);
        player:messageSpecial(6567, 618);
    end
end;

