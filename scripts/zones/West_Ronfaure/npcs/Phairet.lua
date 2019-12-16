-----------------------------------
-- Area: West Ronfaure
--  NPC: Phairet
-- Involved in Quest: The Trader in the Forest
-- !pos -57 -1 -501 100
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    local theTraderInTheforest = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_TRADER_IN_THE_FOREST)

    if theTraderInTheforest == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 592) then -- Trade Supplies Order
        player:startEvent(124)
    elseif theTraderInTheforest == QUEST_COMPLETED and npcUtil.tradeHas(trade, {{"gil", 50}}) and npcUtil.giveItem(player, 4367) then
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    local theTraderInTheforest = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_TRADER_IN_THE_FOREST)
    local hasBatagreens = player:hasItem(4367) -- Clump of Batagreens

    if theTraderInTheforest == QUEST_ACCEPTED then
        if hasBatagreens then
            player:startEvent(125)
        else
            player:startEvent(117)
        end
    elseif theTraderInTheforest == QUEST_COMPLETED or not hasBatagreens then
        player:startEvent(127, 4367)
    else
        player:startEvent(117)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 124 and npcUtil.giveItem(player, 4367) then
        player:confirmTrade()
    end
end