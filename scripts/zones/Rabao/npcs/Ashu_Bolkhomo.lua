-----------------------------------
-- Area: Rabao
--  NPC: Ashu Bolkhomo
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rabao/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    CheckMaps(player, npc, 1006);
end;

function onEventUpdate(player,csid,option)
    if (csid == 1006) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

function onEventFinish(player,csid,option)

end;