-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm1 (???)
-- Spawns Ironclad Triturator
-- !pos -10 -175 56 253
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
