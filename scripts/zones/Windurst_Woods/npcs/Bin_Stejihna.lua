-----------------------------------
-- Area: Windurst_Woods
--  NPC: Bin Stejihna
-- Only sells when Windurst controlls Zulkheim Region
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
    local RegionOwner = GetRegionOwner(ZULKHEIM);
    if (RegionOwner ~= NATION_WINDURST) then
        player:showText(npc,BIN_STEJIHNA_CLOSED_DIALOG);
    else
        player:showText(npc,BIN_STEJIHNA_OPEN_DIALOG);

        local rank = getNationRank(NATION_WINDURST);
        if (rank ~= 3) then
            table.insert(stock,0x0730); --Semolina
            table.insert(stock,1840);
        end

        local stock =
        {
            1840,  1840,  -- Semolina
            4372,    44,  -- Giant Sheep Meat
            622,     44,  -- Dried Marjoram
            610,     55,  -- San d'Orian Flour
            611,     36,  -- Rye Flour
            4366,    22,  -- La Theine Cabbage
            4378,    55   -- Selbina Milk
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
