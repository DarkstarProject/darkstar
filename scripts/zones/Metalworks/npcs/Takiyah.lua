-----------------------------------
-- Area: Metalworks
--  NPC: Takiyah
-- Type: Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Metalworks/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.QUFIMISLAND) ~= dsp.nation.BASTOK then
        player:showText(npc, TAKIYAH_CLOSED_DIALOG)
    else
        local stock =
        {
            954, 4121,    -- Magic Pot Shard
        }

        player:showText(npc, TAKIYAH_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
