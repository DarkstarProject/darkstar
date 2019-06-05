-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Chef Nonberry
-- Type: Quest NPC
-- !pos -135.225 -1 -92.232 159
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(27)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
