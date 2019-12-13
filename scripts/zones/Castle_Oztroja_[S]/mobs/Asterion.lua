-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Asterion
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobFight(mob, target)
    local hpp = mob:getHPP()

    -- As it gets low, its attack speed increases to near perma-hundred fists.
    -- hundred fists is 1700 delay. this formula will range between 4500 and 1700.
    mob:setDelay(1700 + hpp * 28)

    -- Favors Back Swish when higher HP and at around 50% it starts using Mow and Mortal Ray.
    if hpp < 50 then
        mob:setMobMod(dsp.mobMod.SKILL_LIST, 156)
    else
        mob:setMobMod(dsp.mobMod.SKILL_LIST, 155)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
