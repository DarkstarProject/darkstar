-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm10 (???)
-- Spawns Tefnet
-- !pos -127 15 239 45
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
