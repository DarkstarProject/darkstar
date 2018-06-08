-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Matifa
-- Type: Standard NPC
-- !pos -10.583 -1 -8.820 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(541);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

