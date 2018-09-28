-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm10 (???)
-- Spawns Nonno
-- !pos 719 1 -486 216
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
