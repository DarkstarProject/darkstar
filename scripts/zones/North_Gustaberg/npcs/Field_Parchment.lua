-----------------------------------
-- Area: North Gustaberg
--  NPC: Field Parchment
-- Type: Fields of Valor NMs
-- !pos 400.000 -21.5 560.000 106
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(2001)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
