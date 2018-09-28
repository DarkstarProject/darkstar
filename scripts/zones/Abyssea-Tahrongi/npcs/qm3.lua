-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm3 (???)
-- Spawns Ophanim
-- !pos -195 -16 -165 45
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
