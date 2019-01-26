-----------------------------------
-- Area: Foret de Hennetiel
--  NPC: HomePoint#1
-- !pos -193 -0.5 -252 262
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8700
local hpIndex = 47

function onTrigger(player,npc)
    dsp.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventFinish(player,csid,option)
    dsp.homepoint.onEventFinish(player, csid, option, hpEvent)
end