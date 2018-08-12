-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Phamelise
-- Zulkheim Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    else
        onHalloweenTrade(player, trade, npc)
    end
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.ZULKHEIM) ~= dsp.nation.SANDORIA then
        player:showText(npc, PHAMELISE_CLOSED_DIALOG)
    else
        local stock =
        {
            4372,   44,    -- Giant Sheep Meat
            622,    44,    -- Dried Marjoram
            610,    55,    -- San d'Orian Flour
            611,    36,    -- Rye Flour
            1840, 1840,    -- Semolina
            4366,   22,    -- La Theine Cabbage
            4378,   55,    -- Selbina Milk
        }

        player:showText(npc, PHAMELISE_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
