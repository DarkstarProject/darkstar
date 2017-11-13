-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm4 (???)
-- Spawns Emperor de Altepa
-- !pos -491 0 -611 218
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
