-----------------------------------
-- Area: Port Bastok
--  NPC: HomePoint#1
-- !pos 58.850 7.499 -27.790 236
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8700
local hpIndex = 14

function onTrigger(player, npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventUpdate(player, csid, option)
    dsp.homepoint.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end