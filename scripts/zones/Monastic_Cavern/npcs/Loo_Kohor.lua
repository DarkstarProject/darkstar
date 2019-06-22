-----------------------------------
-- Area: Monastic Cavern
--  NPC: Loo Kohor
-- Type: Quest NPC
-- !pos -48.744 -17.741 -104.954 150
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(5)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
