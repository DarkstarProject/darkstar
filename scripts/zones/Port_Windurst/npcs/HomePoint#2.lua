-----------------------------------
-- Area: Port Windurst
--  NPC: HomePoint#2
-- !pos -207 -8.159 210 240
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------

local hpEvent = 8701
local hpIndex = 23

function onTrigger(player, npc)
    tpz.homepoint.onTrigger(player, hpEvent, hpIndex)
end

function onEventUpdate(player, csid, option)
    tpz.homepoint.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    tpz.homepoint.onEventFinish(player, csid, option, hpEvent)
end