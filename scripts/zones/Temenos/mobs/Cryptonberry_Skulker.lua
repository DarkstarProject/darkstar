-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Skulker
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_N_MOB[6]):isDead() then
        GetNPCByID(ID.npc.COFFER_OFFSET+38):setPos(-412, -78, 426)
        GetNPCByID(ID.npc.COFFER_OFFSET+38):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+172):setPos(-415, -78, 427)
        GetNPCByID(ID.npc.COFFER_OFFSET+172):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+214):setPos(-412, -78, 422)
        GetNPCByID(ID.npc.COFFER_OFFSET+214):setStatus(dsp.status.NORMAL)
    end
end
