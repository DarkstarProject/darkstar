-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm12 (???)
-- Spawns Wherwetrice
-- !pos 198.045 20.122 108.705 215
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
