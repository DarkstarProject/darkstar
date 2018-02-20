-----------------------------------
-- Area: Bastok Mines
--  NPC: Aulavia
-- Regional Marchant NPC
-- Only sells when Bastok controls Vollbow.
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
    local RegionOwner = GetRegionOwner(VOLLBOW);

    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,AULAVIA_CLOSED_DIALOG);
    else
        player:showText(npc,AULAVIA_OPEN_DIALOG);
        local stock =
        {
            636,    119,  -- Chamomile
            864,     88,  -- Fish Scales
            936,     14,  -- Rock Salt
            1410,  1656   -- Sweet William
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
