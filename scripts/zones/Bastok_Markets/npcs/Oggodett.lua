-----------------------------------
-- Area: Bastok Markets
--  NPC: Oggodett
-- Only sells when Bastok controlls Aragoneu Region
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(ARAGONEU);
    if (RegionOwner ~= NATION_BASTOK) then
        player:showText(npc,OGGODETT_CLOSED_DIALOG);
    else
        player:showText(npc,OGGODETT_OPEN_DIALOG);

        local stock =
        {
            631,    36,  -- Horo Flour
            629,    44,  -- Millioncorn
            4415,  114,  -- Roasted Corn
            4505,   92,  -- Sunflower Seeds
            841,    36   -- Yagudo Feather
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
