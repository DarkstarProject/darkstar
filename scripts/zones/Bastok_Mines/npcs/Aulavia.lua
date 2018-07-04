-----------------------------------
-- Area: Bastok Mines
--  NPC: Aulavia
-- Vollbow Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    onHalloweenTrade(player, trade, npc)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.VOLLBOW) ~= dsp.nation.BASTOK then
        player:showText(npc, AULAVIA_CLOSED_DIALOG)
    else
        local stock =
        {
            636,   119,    -- Chamomile
            864,    88,    -- Fish Scales
            936,    14,    -- Rock Salt
            1410, 1656,     -- Sweet William
        }

        player:showText(npc, AULAVIA_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
