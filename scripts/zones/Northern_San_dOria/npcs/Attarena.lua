-----------------------------------
--      Area: Northern San d'Oria
--      NPC: Attarena
--      Only sells when San d'Oria controlls Li'Telor Region
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
        onHalloweenTrade(player,trade,npc);
    end
end;

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.LITELOR) ~= dsp.nation.SANDORIA then
        player:showText(npc, ATTARENA_CLOSED_DIALOG)
    else
        local stock =
        {
            623,   119,    -- Bay Leaves
            4154, 6440,    -- Holy Water
        }

        player:showText(npc, ATTARENA_OPEN_DIALOG)
        dsp.shop.general(player, stock, SANDORIA)
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
