-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Rosel
-- Starts and Finishes Quest: Rosel the Armorer
-- @zone 230
-- !pos
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeRosel") == 0) then
            player:messageSpecial(ROSEL_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeRosel",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
            elseif (player:getVar("tradeRosel") ==1) then
                player:messageSpecial(FLYER_ALREADY);
            end
        end
    end;

function onTrigger(player,npc)

    local RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);
    local receiprForThePrince = player:hasKeyItem(RECEIPT_FOR_THE_PRINCE);

    if (player:getVar("RefuseRoselTheArmorerQuest") == 1 and RoselTheArmorer == QUEST_AVAILABLE) then
        player:startEvent(524);
    elseif (RoselTheArmorer == QUEST_AVAILABLE) then
        player:startEvent(523);
        player:setVar("RefuseRoselTheArmorerQuest",1);
    elseif (RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince) then
        player:startEvent(524);
    elseif (RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince == false) then
        player:startEvent(527);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- Rosel the Armorer, get quest and receipt for prince
    if ((csid == 523 or csid == 524) and option == 0) then
        player:addQuest(SANDORIA, ROSEL_THE_ARMORER);
        player:setVar("RefuseRoselTheArmorerQuest",0);
        player:addKeyItem(RECEIPT_FOR_THE_PRINCE);
        player:messageSpecial(KEYITEM_OBTAINED,RECEIPT_FOR_THE_PRINCE);
    -- Rosel the Armorer, finished quest, recieve 200gil
    elseif (csid == 527) then
        npcUtil.completeQuest(player, SANDORIA, ROSEL_THE_ARMORER, {
            title= ENTRANCE_DENIED,
            gil= 200
            });
    end

end;
