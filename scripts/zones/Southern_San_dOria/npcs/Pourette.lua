-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Pourette
-- Derfland Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/npc_util")
require("scripts/globals/quests")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    else
        onHalloweenTrade(player, trade, npc)
    end
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.DERFLAND) ~= dsp.nation.SANDORIA then
        player:showText(npc, POURETTE_CLOSED_DIALOG)
    else
        local stock =
        {
            4352,  128,    -- Derfland Pear
            617,   142,    -- Ginger
            4545,   62,    -- Gysahl Greens
            1412, 1656,    -- Olive Flower
            633,    14,    -- Olive Oil
            951,   110,    -- Wijnruit
        }

        player:showText(npc, POURETTE_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
