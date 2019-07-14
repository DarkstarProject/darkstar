-----------------------------------
-- Area: Horlais Peak
-- MOB: Keeneyed Aufwuf
-- BCNM Fight: Dismemberment Brigade
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 2):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
