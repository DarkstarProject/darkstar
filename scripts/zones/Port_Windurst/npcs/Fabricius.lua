-----------------------------------
-- Area: Port Windurst
--  NPC: Fabricius
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(874);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
