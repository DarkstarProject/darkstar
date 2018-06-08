-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Gate Sentry
-- Type: Standard NPC
-- !pos -265.235 -2.399 405.246 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(253);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

