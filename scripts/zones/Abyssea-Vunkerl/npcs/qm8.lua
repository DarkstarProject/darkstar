-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm8 (???)
-- Spawns Xan
-- !pos 120 -39 -551 217
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
