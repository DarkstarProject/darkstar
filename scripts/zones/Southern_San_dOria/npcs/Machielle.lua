-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Machielle
-- Norvallen Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Southern_San_dOria/TextIDs")
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
    if GetRegionOwner(dsp.region.NORVALLEN) ~= dsp.nation.SANDORIA then
        player:showText(npc, MACHIELLE_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            621, 25,    -- Crying Mustard
            618, 25,    -- Blue Peas
            698, 88,    -- Ash Log
        }

        player:showText(npc,MACHIELLE_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
