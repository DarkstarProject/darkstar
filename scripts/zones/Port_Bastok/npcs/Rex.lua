-----------------------------------
-- Area: Port Bastok
--  NPC: Rex
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    CheckMaps(player, npc, 115);
end;

function onEventUpdate(player,csid,option)
    if (csid == 115) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

function onEventFinish(player,csid,option)

end;