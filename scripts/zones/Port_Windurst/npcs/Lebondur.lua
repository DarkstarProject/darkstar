-----------------------------------
-- Area: Port Windurst
--  NPC: Lebondur
-- Regional Marchant NPC
-- Only sells when Windurst controls Vollbow.
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(VOLLBOW);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,LEBONDUR_CLOSED_DIALOG);
    else
        player:showText(npc,LEBONDUR_OPEN_DIALOG);

        local stock =
        {
            636,    119,  -- Chamomile
            864,     88,  -- Fish Scales
            936,     14,  -- Rock Salt
            1410,  1656   -- Sweet William
        }
        showShop(player,WINDURST,stock);

    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
