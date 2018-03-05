-----------------------------------
-- Area: Windurst Woods
--  NPC: Nya Labiccio
-- Only sells when Windurst controlls Gustaberg Region
-- Confirmed shop stock, August 2013
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(GUSTABERG);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,NYALABICCIO_CLOSED_DIALOG);
    else
        player:showText(npc,NYALABICCIO_OPEN_DIALOG);

        local stock =
        {
            1108,  703, -- Sulfur
            619,    43, -- Popoto
            611,    36, -- Rye Flour
            4388,   40  -- Eggplant
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
