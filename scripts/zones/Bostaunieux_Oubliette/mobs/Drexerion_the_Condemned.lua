-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Drexerion the Condemned
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(216000, 259200)) -- 60 to 72 hours
end
