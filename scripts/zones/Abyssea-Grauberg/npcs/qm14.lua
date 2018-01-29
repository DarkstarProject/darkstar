-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm14 (???)
-- Spawns Amphitrite
-- !pos -147 -31 -220 254
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
