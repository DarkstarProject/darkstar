-----------------------------------
-- Area: Abyssea-Attohwa
--  NPC: Soni-Muni
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-AttohwaTextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Attohwa/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1100);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;