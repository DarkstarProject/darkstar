-----------------------------------
-- Area: Port Windurst
--  NPC: Alizabe
--  Tavnazian Archipelago Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCurrentMission(COP) >= THE_SAVAGE then
        if GetRegionOwner(dsp.region.TAVNAZIANARCH) ~= dsp.nation.WINDURST then
            player:showText(npc, ALIZABE_CLOSED_DIALOG)
        else
            local stock =
            {
                1523,  290,    -- Apple Mint
                5164, 1945,    -- Ground Wasabi
                17005,  99,    -- Lufaise Fly
                5195,  233,    -- Misareaux Parsley
                1695,  920,    -- Habanero Peppers
            }

            player:showText(npc, ALIZABE_OPEN_DIALOG)
            dsp.shop.general(player, stock, WINDURST)
        end
    else
        player:showText(npc, ALIZABE_COP_NOT_COMPLETED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
