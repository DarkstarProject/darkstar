-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Yasmina
-- Type: Chocobo Renter
-- !pos -34.972 -5.815 221.845 94
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:startEvent(6, 10, 10)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
