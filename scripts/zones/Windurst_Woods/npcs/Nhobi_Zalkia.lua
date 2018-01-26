-----------------------------------
-- Area: Windurst_Woods
--  NPC: Nhobi Zalkia
-- Only sells when Windurst controlls Kuzotz Region
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
    local RegionOwner = GetRegionOwner(KUZOTZ);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,NHOBI_ZALKIA_CLOSED_DIALOG);
    else
        player:showText(npc,NHOBI_ZALKIA_OPEN_DIALOG);

        local stock =
        {
            916,   855,  -- Cactuar Needle
            4412,  299,  -- Thundermelon
            4491,  184   -- Watermelon
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
