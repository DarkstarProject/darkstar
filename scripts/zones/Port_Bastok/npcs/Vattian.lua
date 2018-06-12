-----------------------------------
-- Area: Port Bastok
--  NPC: Vattian
-- Only sells when Bastok controlls Kuzotz Region
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(dsp.region.KUZOTZ);
    if (RegionOwner ~= dsp.nation.BASTOK) then
        player:showText(npc,VATTIAN_CLOSED_DIALOG);
    else
        player:showText(npc,VATTIAN_OPEN_DIALOG);

        local stock =
        {
            0x0394,   855,   --Cactuar Needle
            0x113C,   299,   --Thundermelon
            0x118B,   184    --Watermelon
        }
        dsp.shop.general(player, stock, BASTOK);

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
