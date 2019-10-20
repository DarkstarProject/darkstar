-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    GetNPCByID(GATE_OFFSET+1):setStatus(dsp.status.NORMAL)
end
