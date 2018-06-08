-----------------------------------
-- Area: Mhaura
--  NPC: Ludwig
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    CheckMaps(player, npc, 500);
end;

function onEventUpdate(player,csid,option)
    if (csid == 500) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED)
    end
end;

function onEventFinish(player,csid,option)

end;




