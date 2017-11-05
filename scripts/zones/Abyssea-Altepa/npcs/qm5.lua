-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm5 (???)
-- Spawns Tablilla
-- !pos -877 -8 -524 218
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;
