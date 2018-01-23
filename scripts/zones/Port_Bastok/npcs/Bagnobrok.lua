-----------------------------------
-- Area: Port Bastok
--  NPC: Bagnobrok
-- Only sells when Bastok controls Movalpolos
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
    local RegionOwner = GetRegionOwner(MOVALPOLOS);

    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,BAGNOBROK_CLOSED_DIALOG);
    else
        player:showText(npc,BAGNOBROK_OPEN_DIALOG);
        local stock =
        {
            640,     11,  -- Copper Ore
            4450,   694,  -- Coral Fungus
            4375,  4032,  -- Danceshroom
            1650,  6500,  -- Kopparnickel Ore
            5165,   736   -- Movalpolos Water
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
