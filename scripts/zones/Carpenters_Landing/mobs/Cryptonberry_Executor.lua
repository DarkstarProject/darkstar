-----------------------------------
-- Area: Carpenters' Landing
--   NM: Cryptonberry_Executor
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
local ID = require("scripts/zones/Carpenters_Landing/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180) -- 3 minutes
end

function onMobSpawn(mob)
    mob:setLocalVar("waitJobSpec", 180) -- will not use Mijin Gakure for 3 minutes, regardless of HPP.
    mob:setLocalVar("useMainSpecAtHPP", 100)
    mob:setLocalVar("mainQuote", ID.text.CRYPTONBERRY_EXECUTOR_2HR)
end

function onMobFight(mob, target)
    -- spawn Assassins when enmity is gained against Executor
    if mob:getLocalVar("spawnedAssassins") == 0 and mob:getCE(target) > 0 then
        mob:setLocalVar("spawnedAssassins", 1)
        SpawnMob(ID.mob.CRYPTONBERRY_EXECUTOR + 1)
        SpawnMob(ID.mob.CRYPTONBERRY_EXECUTOR + 2)
        SpawnMob(ID.mob.CRYPTONBERRY_EXECUTOR + 3)
    end
end

function onMobDeath(mob, player, isKiller)
    mob:messageText(mob, ID.text.CRYPTONBERRY_EXECUTOR_DIE)
    if player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("Cryptonberry_Executor_KILL") < 2 then
        player:setVar("Cryptonberry_Executor_KILL", 1)
    end
end