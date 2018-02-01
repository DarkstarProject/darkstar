-----------------------------------
-- Area: Bastok_Mines
--  NPC: Mille
-- Only sells when Bastok controlls Norvallen Region
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
    local RegionOwner = GetRegionOwner(NORVALLEN);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,MILLE_CLOSED_DIALOG);
    else
        player:showText(npc,MILLE_OPEN_DIALOG);

        local stock =
        {
            688,  18,  -- Arrowwood Log
            698,  88,  -- Ash Log
            618,  25,  -- Blue Peas
            621,  25   -- Crying Mustard
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
