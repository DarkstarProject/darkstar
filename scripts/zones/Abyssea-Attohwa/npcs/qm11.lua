-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm11 (???)
-- Spawns Nightshade
-- !pos 410.304 19.500 13.227 215
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
