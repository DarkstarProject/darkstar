-----------------------------------
--      Area: Northern San d'Oria
--      NPC: Vichuel
--      Only sells when San d'Oria controlls Fauregandi Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/npc_util")
require("scripts/globals/conquest")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    else
        onHalloweenTrade(player, trade, npc)
    end
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.FAUREGANDI) ~= dsp.nation.SANDORIA then
        player:showText(npc, VICHUEL_CLOSED_DIALOG)
    else
        local stock =
        {
            4571, 90,    -- Beaugreens
            4363, 39,    -- Faerie Apple
            691,  54,    -- Maple Log
        }

        player:showText(npc, VICHUEL_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
