-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Dragoon
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[3]+3):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    GetNPCByID(ID.npc.GATE_OFFSET+2):setStatus(dsp.status.NORMAL)
end
