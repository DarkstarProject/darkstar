    -----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Gennoue
-- Type: Weather Reporter
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Tavnazian_Safehold/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(509,0,0,0,0,0,0,0,VanadielTime());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;