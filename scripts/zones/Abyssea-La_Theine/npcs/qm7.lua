-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm7 (???)
-- Spawns La Theine Liege
-- !pos 80 15 199 132
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
