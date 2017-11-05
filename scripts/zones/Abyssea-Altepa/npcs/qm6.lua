-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm6 (???)
-- Spawns Sharabha
-- !pos -314 0 308 218
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;
