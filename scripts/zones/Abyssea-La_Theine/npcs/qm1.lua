-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm1 (???)
-- Spawns Dozing Dorian
-- !pos 703 40 283 132
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
