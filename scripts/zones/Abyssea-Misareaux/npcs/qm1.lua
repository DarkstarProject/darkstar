-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm1 (???)
-- Spawns Minax Bugard
-- !pos 520 15 -268 216
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
