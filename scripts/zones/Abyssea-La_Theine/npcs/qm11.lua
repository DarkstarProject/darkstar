-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm11 (???)
-- Spawns Toppling Tuber
-- !pos -325 38 201 132
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
