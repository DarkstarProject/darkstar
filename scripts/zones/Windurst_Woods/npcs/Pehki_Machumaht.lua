-----------------------------------
-- Area: Windurst Woods
--  NPC: Pehki Machumaht
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player, npc)
    CheckMaps(player, npc, 10000);
end;

function onEventUpdate(player, csid, option)
    if (csid == 10000) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

function onEventFinish(player,csid,option)

end;