-----------------------------------
-- Area: Grand Palace of HuXzoi
--  MOB: Qn'aern
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    local mJob = mob:getMainJob()
    if (mJob == dsp.job.RDM) then
        mob:setMod(dsp.mod.FASTCAST,15)
    elseif (mJob == dsp.job.WHM) then
        mob:setMod(dsp.mod.REGEN, 3)
    end
end

function onMobDeath(mob, player, isKiller)
end
