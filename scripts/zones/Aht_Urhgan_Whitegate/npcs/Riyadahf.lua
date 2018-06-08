-----------------------------------
-- Area: Aht'Urhgan Whitegate
--  NPC: Riyadahf
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/magic_maps");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    CheckMaps(player, npc, 563);
end;

function onEventUpdate(player,csid,option)
    if (csid == 563) then
        CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
    end
end;

function onEventFinish(player,csid,option)

end;