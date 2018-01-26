-----------------------------------
-- Area: Windurst Waters
--  NPC: Maqu Molpih
-- Only sells when Windurst controlls Aragoneu Region
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
    local RegionOwner = GetRegionOwner(ARAGONEU);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,MAQUMOLPIH_CLOSED_DIALOG);
    else
        player:showText(npc,MAQUMOLPIH_OPEN_DIALOG);

        local stock =
        {
            631,    36,  -- Horo Flour
            629,    44,  -- Millioncorn
            4415,  114,  -- Roasted Corn
            4505,   92,  -- Sunflower Seeds
            841,    36   -- Yagudo Feather
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
