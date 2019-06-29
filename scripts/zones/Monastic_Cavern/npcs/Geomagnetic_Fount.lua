-----------------------------------
-- Area: Monastic Cavern (150)
--  NPC: Geomagnetic Fount (17391859)
-- !pos: 0.000 0.000 -312.000 -- TODO: Place me
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest/IDs")
require("scripts/globals/geomagnetic_fount")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.geomagneticFount.checkFount(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end