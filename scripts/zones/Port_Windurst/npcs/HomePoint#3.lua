-----------------------------------
-- Area: Port Windurst
--  NPC: HomePoint#3
-- !pos 180 -12 226 240
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8702
local hpIndex = 24

function onTrigger(player,npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventFinish(player,csid,option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end