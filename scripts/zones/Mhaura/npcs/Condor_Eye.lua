-----------------------------------
-- Area: Mhaura
--  NPC: Condor Eye
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(13);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
