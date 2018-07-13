-----------------------------------
-- Area: Carpenters' Landing
--   NM: Cryptonberry_Assassin
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Carpenters_Landing/TextIDs")
require("scripts/zones/Carpenters_Landing/MobIDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180) -- 3 minutes
end

function onMobSpawn(mob)
    mob:setLocalVar("mainQuote", CRYPTONBERRY_ASSASSIN_2HR)
    mob:setLocalVar("despawnTime", os.time() + 180)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("despawnTime", 0)
end

function onMobRoam(mob)
    -- if not claimed within 3 minutes of spawning, despawn
    local despawnTime = mob:getLocalVar("despawnTime")
    if despawnTime > 0 and os.time() > despawnTime then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("Cryptonberry_Executor_KILL") < 2 then
        local offset = mob:getID() - CRYPTONBERRY_EXECUTOR
        player:setVar(string.format("Cryptonberry_Assassins-%i_KILL", offset), 1)
    end
end