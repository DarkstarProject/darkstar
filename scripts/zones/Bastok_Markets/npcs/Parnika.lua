-----------------------------------
-- Area: Bastok Markets
--  NPC: Parnika
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(136);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

