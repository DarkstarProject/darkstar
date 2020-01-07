-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Rosel
-- Starts and Finishes Quest: Rosel the Armorer
-- !zone 230
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getCharVar("tradeRosel") == 0) then
            player:messageSpecial(ID.text.ROSEL_DIALOG);
            player:addCharVar("FFR", -1)
            player:setCharVar("tradeRosel",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
            elseif (player:getCharVar("tradeRosel") ==1) then
                player:messageSpecial(ID.text.FLYER_ALREADY);
            end
        end
    end;

function onTrigger(player,npc)

    local RoselTheArmorer = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.ROSEL_THE_ARMORER);
    local receiprForThePrince = player:hasKeyItem(dsp.ki.RECEIPT_FOR_THE_PRINCE);

    if (player:getCharVar("RefuseRoselTheArmorerQuest") == 1 and RoselTheArmorer == QUEST_AVAILABLE) then
        player:startEvent(524);
    elseif (RoselTheArmorer == QUEST_AVAILABLE) then
        player:startEvent(523);
        player:setCharVar("RefuseRoselTheArmorerQuest",1);
    elseif (RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince) then
        player:startEvent(524);
    elseif (RoselTheArmorer == QUEST_ACCEPTED and receiprForThePrince == false) then
        player:startEvent(527);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- Rosel the Armorer, get quest and receipt for prince
    if ((csid == 523 or csid == 524) and option == 0) then
        player:addQuest(SANDORIA, dsp.quest.id.sandoria.ROSEL_THE_ARMORER);
        player:setCharVar("RefuseRoselTheArmorerQuest",0);
        player:addKeyItem(dsp.ki.RECEIPT_FOR_THE_PRINCE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.RECEIPT_FOR_THE_PRINCE);
    -- Rosel the Armorer, finished quest, recieve 200gil
    elseif (csid == 527) then
        npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.ROSEL_THE_ARMORER, {
            title= dsp.title.ENTRANCE_DENIED,
            gil= 200
            });
    end

end;
