-----------------------------------
-- Area: Al Zahbi
--  NPC: Famatar
-- Type: Imperial Gate Guard
-- !pos -105.538 0.999 75.456 48
-----------------------------------
require("scripts/globals/besieged")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.besieged.onTrigger(player, npc, 218)
end

function onEventUpdate(player, csid, option)
    dsp.besieged.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.besieged.onEventFinish(player, csid, option)
end