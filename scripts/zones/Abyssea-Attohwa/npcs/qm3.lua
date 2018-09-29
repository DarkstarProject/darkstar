-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm3 (???)
-- Spawns Pallid Percy
-- !pos 281.063 20.376 174.011 215
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
