-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm1 (???)
-- Spawns Halimede
-- !pos -234 15 -603 45
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
