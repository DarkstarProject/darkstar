-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mathlouq
-- Type: Standard NPC
-- !pos -92.892 -7 129.277 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(543);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

