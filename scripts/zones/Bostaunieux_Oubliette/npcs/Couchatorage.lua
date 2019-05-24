-----------------------------------
-- Area: Bostaunieux Oubliette
--  NPC: Couchatorage
-- Type: Standard NPC
-- !pos -20.502 -19 17.765 167
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(9)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
