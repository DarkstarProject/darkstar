-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    GetNPCByID(ID.npc.GATE_OFFSET+1):setStatus(dsp.status.NORMAL)
end
