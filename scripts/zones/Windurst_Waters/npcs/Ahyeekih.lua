-----------------------------------
-- Area: Windurst Waters
--  NPC: Ahyeekih
-- Only sells when Windurst controls Kolshushu
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(KOLSHUSHU);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,AHYEEKIH_CLOSED_DIALOG);
    else
        player:showText(npc,AHYEEKIH_OPEN_DIALOG);

        local stock =
        {
            4503,   184,  -- Buburimu Grape
            1120,  1620,  -- Casablanca
            4359,   220,  -- Dhalmel Meat
            614,     72,  -- Mhaura Garlic
            4445,    40   -- Yagudo Cherry
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
