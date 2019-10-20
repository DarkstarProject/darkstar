-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Dragoon
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(16928791):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    GetNPCByID(GATE_OFFSET+2):setStatus(dsp.status.NORMAL)
end
