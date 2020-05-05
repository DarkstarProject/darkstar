-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Charmer
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[6]+1):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+2):setStatus(dsp.status.NORMAL)
        end
    end
end
