-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm2 (???)
-- Spawns Vetehinen
-- !pos 74 .001 -435 45
-----------------------------------
require("scripts/globals/abyssea");
-----------------------------------

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
