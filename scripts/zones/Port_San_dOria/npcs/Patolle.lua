-----------------------------------
-- Area: Port San d'Oria
--  NPC: Patolle
-- Kuzotz Regional Merchant
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
    if GetRegionOwner(dsp.region.KUZOTZ) ~= dsp.nation.SANDORIA then
        player:showText(npc, PATOLLE_CLOSED_DIALOG)
    else
        local stock =
        {
            916,  855,    -- Cactuar Needle
            4412, 299,    -- Thundermelon
            4491, 184,    -- Watermelon
        }

        player:showText(npc, PATOLLE_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
