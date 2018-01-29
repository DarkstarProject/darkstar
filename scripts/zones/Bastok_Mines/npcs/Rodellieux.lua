-----------------------------------
-- Area: Bastok_Mines
--  NPC: Rodellieux
-- Only sells when Bastok controlls Fauregandi Region
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(FAUREGANDI);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,RODELLIEUX_CLOSED_DIALOG);
    else
        player:showText(npc,RODELLIEUX_OPEN_DIALOG);
        local stock =
        {
            4571,    90,  -- Beaugreens
            4363,    39,  -- Faerie Apple
            691,     54   -- Maple Log
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
