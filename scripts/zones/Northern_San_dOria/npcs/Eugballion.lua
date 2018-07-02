-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Eugballion
-- Only sells when San d'Oria controlls Qufim Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/conquest")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.QUFIMISLAND) ~= dsp.nation.SANDORIA then
        player:showText(npc, EUGBALLION_CLOSED_DIALOG)
    else
        local stock =
        {
            954, 4121,    -- Magic Pot Shard
        }

        player:showText(npc,EUGBALLION_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
