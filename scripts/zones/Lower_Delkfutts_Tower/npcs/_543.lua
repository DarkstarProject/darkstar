-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(DOOR_FIRMLY_SHUT);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;