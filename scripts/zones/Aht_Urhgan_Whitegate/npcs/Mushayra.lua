-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mushayra
-- Type: Standard NPC
-- !pos -111.551 -6.999 -61.720 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(519);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

