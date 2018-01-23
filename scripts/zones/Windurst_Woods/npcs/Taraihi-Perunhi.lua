-----------------------------------
-- Area: Windurst Woods
--  NPC: Taraihi-Perunhi
-- Only sells when Windurst controlls Derfland Region
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(DERFLAND);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,TARAIHIPERUNHI_CLOSED_DIALOG);
    else
        player:showText(npc,TARAIHIPERUNHI_OPEN_DIALOG);

        local stock =
        {
            4352,  128, -- Derfland Pear
            617,   142, -- Ginger
            4545,   62, -- Gysahl Greens
            1412, 1656, -- Olive Flower
            633,    14, -- Olive Oil
            951,   110  -- Wijnruit
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
