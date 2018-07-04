-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Justi
-- Conquest depending furniture seller
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    local stock =
    {
        32, 170726, 1,    -- Dresser
        55,  69888, 1,    -- Cabinet
        59,  57333, 1,    -- Chiffonier
        49,  35272, 2,    -- Coffer
        1657,   92, 3,    -- Bundling Twine
        93,    518, 3,    -- Water Cask
        57,  15881, 3,    -- Cupboard
        24, 129168, 3,    --Oak Table
        46,   8376, 3,    --Armor Box
    }

    player:showText(npc, JUSTI_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
