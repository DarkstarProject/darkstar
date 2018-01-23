-----------------------------------
-- Area: Bastok_Mines
--  NPC: Faustin
-- Only sells when Bastok controlls Ronfaure Region
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(RONFAURE);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,FAUSTIN_CLOSED_DIALOG);
    else
        player:showText(npc,FAUSTIN_OPEN_DIALOG);

        local stock =
        {
            639,    110, -- Chestnut
            4389,    29, -- San d'Orian Carrot
            610,     55, -- San d'Orian Flour
            4431,    69  -- San d'Orian Grape
        };
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
