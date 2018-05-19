-----------------------------------
-- Area: Port Jeuno
--  NPC: Door: Arrivals (from San d'Oria)
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:startEvent(54);
    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;