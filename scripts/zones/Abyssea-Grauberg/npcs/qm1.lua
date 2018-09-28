-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm1 (???)
-- Spawns Ironclad Sunderer
-- !pos 501 25 503 254
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
