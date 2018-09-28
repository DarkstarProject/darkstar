-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm9 (???)
-- Spawns Chillwing Hwitti
-- !pos -484 -20 -85 253
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
