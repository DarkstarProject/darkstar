-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm16 (???)
-- Spawns Karkadann
-- !pos -158 -32 118 217
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
    abysseaOnEventUpdate(player,csid,option);
end;

function onEventFinish(player,csid,option)
    abysseaOnEventFinish(player,csid,option);
end;
