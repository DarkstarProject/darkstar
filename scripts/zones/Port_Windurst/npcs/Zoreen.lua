-----------------------------------
-- Area: Port Windurst
--  NPC: Zoreen
-- Regional Marchant NPC
-- Only sells when Windurst controls Valdeaunia
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
    local RegionOwner = GetRegionOwner(VALDEAUNIA);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,ZOREEN_CLOSED_DIALOG);
    else
        player:showText(npc,ZOREEN_OPEN_DIALOG);

        local stock =
        {
            4382,   29,  -- Frost Turnip
            638,   170   -- Sage
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
