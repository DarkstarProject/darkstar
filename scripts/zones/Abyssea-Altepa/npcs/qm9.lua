-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm9 (???)
-- Spawns Vadleany
-- !pos -56 1 123 218
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;
