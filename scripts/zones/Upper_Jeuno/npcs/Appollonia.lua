-----------------------------------
-- Area: Upper Jeuno
--  NPC: Appollonia
-- Type: Weather Reporter
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(534296,0,0,0,0,0,0,0,VanadielTime());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;