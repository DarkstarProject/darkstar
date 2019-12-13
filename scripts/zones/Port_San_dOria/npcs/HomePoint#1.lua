-----------------------------------
-- Area: Port San dOria
--  NPC: HomePoint#1
-- !pos -67.963 -4.000 -105.023 232
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8700
local hpIndex = 6

function onTrigger(player, npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventUpdate(player, csid, option)
    dsp.homepoint.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end