-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm1 (???)
-- Spawns Granite Borer
-- !pos 401.489 19.730 -282.864 215
-----------------------------------
require("scripts/globals/abyssea");

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
