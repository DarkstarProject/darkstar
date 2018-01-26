-----------------------------------
-- Area: Port Bastok
--  NPC: Belka
-- Only sells when Bastok controlls Derfland Region
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
    local RegionOwner = GetRegionOwner(DERFLAND);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,BELKA_CLOSED_DIALOG);
    else
        player:showText(npc,BELKA_OPEN_DIALOG);
        local stock =
        {
            4352,   128,  -- Derfland Pear
            617,    142,  -- Ginger
            4545,    62,  -- Gysahl Greens
            1412,  1656,  -- Olive Flower
            633,     14,  -- Olive Oil
            951,    110   -- Wijnruit
        }
        showShop(player,BASTOK,stock);

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
