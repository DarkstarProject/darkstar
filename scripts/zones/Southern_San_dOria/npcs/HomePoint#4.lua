-----------------------------------
-- Area: Southern San dOria
--  NPC: HomePoint#4
-- !pos -165 -1 11 230
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8703
local hpIndex = 97

function onTrigger(player, npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventUpdate(player, csid, option)
    dsp.homepoint.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end