-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm21 (???)
-- Spawns Lacovie
-- !pos -316 24 442 45
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
    abysseaOnEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    abysseaOnEventFinish(player,csid,option)
end
