-----------------------------------
-- Area: Bastok Markets
--  NPC: Somn-Paemn
-- Sarutabaruta Regional Goods
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.SARUTABARUTA) ~= dsp.nation.BASTOK then
        player:showText(npc, SOMNPAEMN_CLOSED_DIALOG)
    else
        local stock =
        {
            689,  33,    --Lauan Log
            619,  43,    --Popoto
            4444, 22,    --Rarab Tail
            4392, 29,    --Saruta Orange
            635,  18,     --Windurstian Tea Leaves
        }

        player:showText(npc, SOMNPAEMN_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
