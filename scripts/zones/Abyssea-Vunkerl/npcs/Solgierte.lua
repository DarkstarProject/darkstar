-----------------------------------
-- Area: Abyssea_Vunkeral
--  NPC: Solgierte
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Vunkerl/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1098);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;