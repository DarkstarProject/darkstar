-----------------------------------
-- Area: Cape Teriggan
--  NPC: HomePoint#1
-- !pos -303 -8 526 113
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8700
local hpIndex = 91

function onTrigger(player,npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventFinish(player,csid,option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end