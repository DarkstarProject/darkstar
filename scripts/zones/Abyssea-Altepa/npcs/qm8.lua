-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm8 (???)
-- Spawns Chickcharney
-- !pos 36 0 -240 218
-----------------------------------
require("scripts/globals/abyssea");

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade);
end;

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc);
end;
