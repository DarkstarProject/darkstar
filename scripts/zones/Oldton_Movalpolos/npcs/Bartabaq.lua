-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Bartabaq
-- Type: Outpost Vendor
-- !pos -261.930 6.999 -49.145 11
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(32756)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
