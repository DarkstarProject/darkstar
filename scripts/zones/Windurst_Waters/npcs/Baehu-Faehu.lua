-----------------------------------
-- Area: Windurst Waters
--  NPC: Baehu-Faehu
-- Only sells when Windurst has control of Sarutabaruta
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(SARUTABARUTA);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,BAEHUFAEHU_CLOSED_DIALOG);
    else
        player:showText(npc,BAEHUFAEHU_OPEN_DIALOG);

        local stock =
        {
            4444,  22,  -- Rarab Tail
            689,   33,  -- Lauan Log
            619,   43,  -- Popoto
            4392,  29,  -- Saruta Orange
            635,   18   -- Windurstian Tea Leaves
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
