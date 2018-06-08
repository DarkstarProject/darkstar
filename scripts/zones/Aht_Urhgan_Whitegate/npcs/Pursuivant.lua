-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Pursuivant
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(773);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

