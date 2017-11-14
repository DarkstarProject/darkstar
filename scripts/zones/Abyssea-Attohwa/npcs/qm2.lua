-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm2 (???)
-- Spawns Blazing Eruca
-- !pos 233.162 19.720 -243.255 215
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
