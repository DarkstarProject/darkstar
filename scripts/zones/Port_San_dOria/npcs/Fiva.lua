-----------------------------------
-- Area: Port San d'Oria
--  NPC: Fiva
-- Kolshushu Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.KOLSHUSHU) ~= dsp.nation.SANDORIA then
        player:showText(npc, FIVA_CLOSED_DIALOG)
    else
        local stock =
        {
            4503,  184,    -- Buburimu Grape
            1120, 1620,    -- Casablanca
            4359,  220,    -- Dhalmel Meat
            614,    72,    -- Mhaura Garlic
            4445,   40,    -- Yagudo Cherry
        }

        player:showText(npc, FIVA_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
