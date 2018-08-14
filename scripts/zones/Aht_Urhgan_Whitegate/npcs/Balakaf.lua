-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Balakaf
-- Type: Standard NPC
-- !pos 25.505 -6.999 126.478 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(515);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

