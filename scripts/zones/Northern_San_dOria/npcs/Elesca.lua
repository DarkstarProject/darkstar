-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Elesca
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    CheckMaps(player, npc, 0x0237);
end;

function onEventUpdate(player,csid,option)
    if (csid == 567) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

function onEventFinish(player,csid,option)

end;