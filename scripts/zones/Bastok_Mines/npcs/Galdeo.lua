-----------------------------------
-- Area: Bastok Mines
--  NPC: Galdeo
-- Only sells when Bastok controlls Li'Telor Region
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
    local RegionOwner = GetRegionOwner(LITELOR);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,GALDEO_CLOSED_DIALOG);
    else
        player:showText(npc,GALDEO_OPEN_DIALOG);
        local stock =
        {
            623,    119, -- Bay Leaves
            4154,  6440  -- Holy Water
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
