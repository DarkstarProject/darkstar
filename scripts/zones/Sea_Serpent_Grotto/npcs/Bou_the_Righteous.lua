-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: Bou the Righteous
-- Type: Involved in the "Sahagin Key Quest"
-- !pos -125.029 46.568 -334.778 176
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(108)
    player:setCharVar("SahaginKeyProgress", 2)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
