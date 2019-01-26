-----------------------------------
-- Area: South Gustaberg
--  NPC: Fish Eyes
-- Type: Goldfish Scooping
-- !pos -444.459 39.106 -390.885 107
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(903)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
