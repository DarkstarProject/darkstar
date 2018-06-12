-----------------------------------
-- Area: Abyssea - Grauberg
--  NPC: Dominion Sergeant
--
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/abyssea");
require("scripts/zones/Abyssea-Grauberg/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(500)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;