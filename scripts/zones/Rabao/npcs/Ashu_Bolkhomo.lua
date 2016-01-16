-----------------------------------
-- Area: Rabao
-- NPC: Ashu Bolkhomo
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;

require("scripts/zones/Rabao/TextIDs");
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
    CheckMaps(player, npc, 0x03EE);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    if (csid == 0x03EE) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

end;