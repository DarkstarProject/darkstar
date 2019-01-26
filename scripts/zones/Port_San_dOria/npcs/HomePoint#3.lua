-----------------------------------
-- Area: Port San dOria
--  NPC: HomePoint#3
-- !pos -6 -13 -150 232
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8702
local hpIndex = 8

function onTrigger(player,npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventFinish(player,csid,option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end