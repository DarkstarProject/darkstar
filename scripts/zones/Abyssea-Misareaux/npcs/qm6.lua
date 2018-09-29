-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm6 (???)
-- Spawns Ironclad Observer
-- !pos -198.742 -32.162 77.431 216
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
