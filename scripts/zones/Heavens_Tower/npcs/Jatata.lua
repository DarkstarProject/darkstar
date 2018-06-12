-----------------------------------
-- Area: Heaven's Tower
--  NPC: Jatata
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Heavens_Tower/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(77);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

