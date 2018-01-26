-----------------------------------
-- Area: Port Windurst
--  NPC: Sheia Pohrichamaha
-- Only sells when Windurst controlls Fauregandi Region
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
    local RegionOwner = GetRegionOwner(FAUREGANDI);

    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,SHEIAPOHRICHAMAHA_CLOSED_DIALOG);
    else
        player:showText(npc,SHEIAPOHRICHAMAHA_OPEN_DIALOG);

        local stock =
        {
            4571,   90,  -- Beaugreens
            4363,   39,  -- Faerie Apple
            691,    54   -- Maple Log
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
