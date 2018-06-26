-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Palguevion
-- Only sells when San d'Oria controlls Valdeaunia Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
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
    if GetRegionOwner(dsp.region.VALDEAUNIA) ~= dsp.nation.SANDORIA then
        player:showText(npc, PALGUEVION_CLOSED_DIALOG)
    else
        local stock =
        {
            4382,  29,    -- Frost Turnip
            638,  170,    -- Sage
        }

        player:showText(npc, PALGUEVION_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
