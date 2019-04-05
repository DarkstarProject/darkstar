-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: Hawk Nose
-- Type: Quest NPC
-- !pos .1 -1 .1 174
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(14)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
