-----------------------------------
-- Area: Port Windurst
--  NPC: Sattsuh Ahkanpari
-- Elshimo Uplands Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.ELSHIMOUPLANDS) ~= dsp.nation.WINDURST then
        player:showText(npc, SATTSUHAHKANPARI_CLOSED_DIALOG)
    else
        local stock =
        {
            1413, 1656,    -- Cattleya
            628,   239,    -- Cinnamon
            4468,   73,    -- Pamamas
            721,   147,    -- Rattan Lumber
        }

        player:showText(npc, SATTSUHAHKANPARI_OPEN_DIALOG)
        dsp.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
