-----------------------------------
-- Area: Rabao
--  NPC: Irmilant
-- Starts and Ends Quests: The Immortal Lu Shang and Indomitable Spirit
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    Indomitable = player:getQuestStatus(OUTLANDS,INDOMITABLE_SPIRIT);
    ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);

    if ((ImmortalLuShang == QUEST_ACCEPTED or ImmortalLuShang == QUEST_COMPLETED) and trade:hasItemQty(720,1) and trade:hasItemQty(489,1) and trade:hasItemQty(4102,2) and trade:getItemCount() == 4) then
        player:startEvent(78);
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and trade:hasItemQty(1837,1) and trade:hasItemQty(1826,1) and trade:getItemCount() == 2) then
        player:startEvent(132);
    end
end;

function onTrigger(player,npc)
    Indomitable = player:getQuestStatus(OUTLANDS,INDOMITABLE_SPIRIT);
    ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);
    realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day

    if (player:hasItem(489) == true and (ImmortalLuShang == QUEST_AVAILABLE or ImmortalLuShang == QUEST_COMPLETED)) then
        player:startEvent(77); --Offer the quest if the player has the broken rod
    elseif (player:hasKeyItem(1977) == true and (Indomitable == QUEST_AVAILABLE or Indomitable == QUEST_COMPLETED)) then
        player:startEvent(131); --Begins Indomitable Spirit
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and realday == player:getVar("IndomitableSpiritVar")) then
        player:startEvent(133); --Asks the player to wait
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and realday ~= player:getVar("IndomitableSpiritVar")) then
        player:startEvent(134); --Ends the Quest
    elseif (Indomitable == QUEST_COMPLETED) then
        player:startEvent(135); --Dialogue for those who have completed Indomitable Spirit
    else
        player:startEvent(76); --Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 77) then
        player:addQuest(OUTLANDS,THE_IMMORTAL_LU_SHANG);
    elseif (csid == 78) then
        player:tradeComplete();
        player:addTitle(265);
        player:addItem(17386); -- Lu Shang's Fishing Rod
        player:messageSpecial(ITEM_OBTAINED, 17386);
        player:completeQuest(OUTLANDS,THE_IMMORTAL_LU_SHANG);
        player:addFame(RABAO,60);
    elseif (csid == 131) then
        player:addQuest(OUTLANDS,201);
    elseif (csid == 132) then
        player:tradeComplete();
        player:setVar("IndomitableSpiritVar", os.date("%j")); -- %M for next minute, %j for next day
    elseif (csid == 134) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17011);
        else
            player:addTitle(265);
            player:addItem(17011); -- Ebisu Fishing Rod
            player:messageSpecial(ITEM_OBTAINED, 17011);
            player:completeQuest(OUTLANDS,201);
            player:addFame(RABAO,100);
        end
    end
end;

