-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm21 (???)
-- Spawns Hadhayosh
-- !pos 449 24 40 132
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
