-----------------------------------
-- Area: AlTaieu
--  NPC: HomePoint#2
-- !pos -532 0 447 33
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8701
local hpIndex = 86

function onTrigger(player, npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventUpdate(player, csid, option)
    dsp.homepoint.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end