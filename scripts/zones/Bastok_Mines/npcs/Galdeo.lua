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
    local RegionOwner = GetRegionOwner(dsp.region.LITELOR);
    if (RegionOwner ~= dsp.nation.BASTOK) then
        player:showText(npc,GALDEO_CLOSED_DIALOG);
    else
        player:showText(npc,GALDEO_OPEN_DIALOG);
        local stock =
        {
            623,    119, -- Bay Leaves
            4154,  6440  -- Holy Water
        }
        dsp.shop.general(player, stock, BASTOK);

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
