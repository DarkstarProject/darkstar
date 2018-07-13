-----------------------------------
-- Area: Rabao
--  NPC: Amaja-Kumaja
-- Type: Weather Reporter
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1005,0,0,0,0,0,0,0,VanadielTime());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;