-----------------------------------
-- Area: Bastok_Mines
--  NPC: Mille
-- Norvallen Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
    onHalloweenTrade(player, trade, npc)
end;

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.NORVALLEN) ~= dsp.nation.BASTOK then
        player:showText(npc, MILLE_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            698, 88,    -- Ash Log
            618, 25,    -- Blue Peas
            621, 25,     -- Crying Mustard
        }

        player:showText(npc, MILLE_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
