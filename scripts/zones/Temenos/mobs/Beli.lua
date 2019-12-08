-----------------------------------
-- Area: Temenos N T
--  Mob: Beli
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2]+1):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[2]+1):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2]+2):setStatus(dsp.status.NORMAL)
        end
    end
end