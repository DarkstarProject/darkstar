-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm6 (???)
-- Spawns Upas-Kamuy
-- !pos -212 -184 449 253
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
