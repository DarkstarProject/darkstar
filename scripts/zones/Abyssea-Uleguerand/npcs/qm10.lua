-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm10 (???)
-- Spawns Audumbla
-- !pos 337 20 -277 253
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
