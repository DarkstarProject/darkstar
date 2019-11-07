-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Skulker
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[6]):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]):setPos(-410.9, -78, 428.56) 
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+1):setPos(-407.59, -78, 425.67)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+2):setPos(-414.25, -78, 431.35)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+2):setStatus(dsp.status.NORMAL)
        end
    end
end
