-----------------------------------
-- Area: Port Bastok
--  NPC: Dhen Tevryukoh
-- Only sells when Bastok controlls Elshimo Uplands
-- !pos 35 -2 2 236
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
    local RegionOwner = GetRegionOwner(ELSHIMOUPLANDS);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,DHENTEVRYUKOH_CLOSED_DIALOG);
    else
        player:showText(npc,DHENTEVRYUKOH_OPEN_DIALOG);

        local stock =
        {
            1413,  1656,  -- Cattleya
            628,    239,  -- Cinnamon
            4468,    73,  -- Pamamas
            721,    147   -- Rattan Lumber
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
