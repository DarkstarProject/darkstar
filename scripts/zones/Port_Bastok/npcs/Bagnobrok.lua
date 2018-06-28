-----------------------------------
-- Area: Port Bastok
--  NPC: Bagnobrok
-- Movalpolos Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.MOVALPOLOS) ~= dsp.nation.BASTOK then
        player:showText(npc, BAGNOBROK_CLOSED_DIALOG)
    else
        local stock =
        {
            640,    11,    -- Copper Ore
            4450,  694,    -- Coral Fungus
            4375, 4032,    -- Danceshroom
            1650, 6500,    -- Kopparnickel Ore
            5165,  736,    -- Movalpolos Water
        }

        player:showText(npc, BAGNOBROK_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
