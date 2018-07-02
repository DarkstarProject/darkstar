-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Boncort
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        if player:getVar("tradeBoncort") == 0 then
            player:confirmTrade()
            player:messageSpecial(BONCORT_DIALOG)
            player:messageSpecial(FLYER_ACCEPTED)
            player:setVar("FFR", player:getVar("FFR") - 1)
            player:setVar("tradeBoncort", 1)
        else
            player:messageSpecial(FLYER_ALREADY)
        end
    end
end;

function onTrigger(player,npc)
    local stock =
    {
        4441, 837, 1,    --Grape Juice
        4356, 180, 2,    --White Bread
        4380, 198, 2,    --Smoked Salmon
        4423, 270, 2,    --Apple Juice
        4364, 108, 3,    --Black Bread
        4376, 108, 3,    --Meat Jerky
        4509,  10, 3,    --Distilled Water
        5007, 163, 3,    --Scroll of Sword Madrigal
    }

    player:showText(npc, BONCORT_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
