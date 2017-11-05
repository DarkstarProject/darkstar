-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm7 (???)
-- Spawns Waugyl
-- !pos -408 1 -299 218
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;
