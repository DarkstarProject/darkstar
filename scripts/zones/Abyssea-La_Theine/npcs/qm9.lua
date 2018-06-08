-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm9 (???)
-- Spawns Nguruvilu
-- !pos 311 23 -524 132
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
