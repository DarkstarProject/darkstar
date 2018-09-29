-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm10 (???)
-- Spawns Bugul Noz
-- !pos -608 -1 -397 218
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
