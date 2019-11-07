-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Charmer
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[6]+1):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]):setPos(-470, -78.5, 426)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+1):setPos(-468,-78.5,428)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+2):setPos(-466,-78.5,430)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[6]+2):setStatus(dsp.status.NORMAL)
        end
    end
end
