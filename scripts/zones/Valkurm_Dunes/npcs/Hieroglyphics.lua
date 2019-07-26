-----------------------------------
-- Area: Valkurm_Dunes
--  NPC: Hieroglyphics
-- Dynamis Valkurm_Dunes Enter
-- !pos 117 -10 133 103
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dynamis.entryNpcOnTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.entryNpcOnEventFinish(player, csid, option)
end
