-----------------------------------
-- Area: Bastok Mines
--  NPC: Galdeo
--  Li'Telor Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.LITELOR) ~= dsp.nation.BASTOK then
        player:showText(npc, GALDEO_CLOSED_DIALOG)
    else
        local stock =
        {
            623,   119,    -- Bay Leaves
            4154, 6440,    -- Holy Water
        }

        player:showText(npc, GALDEO_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
