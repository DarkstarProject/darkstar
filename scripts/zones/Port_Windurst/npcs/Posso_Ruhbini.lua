-----------------------------------
-- Area: Port Windurst
--  NPC: Posso Ruhbini
-- Regional Marchant NPC
-- Only sells when Windurst controlls Norvallen
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
    local RegionOwner = GetRegionOwner(NORVALLEN);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,POSSORUHBINI_CLOSED_DIALOG);
    else
        player:showText(npc,POSSORUHBINI_OPEN_DIALOG);

        local stock =
        {
            688,    18,  -- Arrowwood Log
            698,    87,  -- Ash Log
            618,    25,  -- Blue Peas
            621,    25   -- Crying Mustard
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
