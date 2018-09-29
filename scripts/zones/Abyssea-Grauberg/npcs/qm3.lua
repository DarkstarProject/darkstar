-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm3 (???)
-- Spawns Teugghia
-- !pos -68 -6 656 254
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
