-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm12 (???)
-- Spawns Lugarhoo
-- !pos -85 24 -513 132
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player,npc,trade)
    abysseaOnTrade(player,npc,trade)
end

function onTrigger(player,npc)
    abysseaOnTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
