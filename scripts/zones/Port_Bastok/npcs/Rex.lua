-----------------------------------
-- Area: Port Bastok
-- NPC: Rex
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;

require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/magic_maps");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    CheckMaps(player, npc, 0x0073);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    if (csid == 0x0073) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

end;