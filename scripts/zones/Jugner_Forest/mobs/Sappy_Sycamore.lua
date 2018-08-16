----------------------------------
-- Area: Jugner_Forest
--  NM:  Sappy Sycamore
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addMod(dsp.mod.SLEEPRES,20)
    mob:addMod(dsp.mod.BINDRES,20)
end

function onMobSpawn(mob)
end

function onAdditionalEffect(mob, target, damage)
    -- Guesstimating 1 in 4 chance to slow on melee.
    if math.random(1, 100) >= 25 or target:hasStatusEffect(dsp.effect.SLOW) then
        return 0, 0, 0
    else
        local duration = math.random(15, 25)
        target:addStatusEffect(dsp.effect.SLOW, 1500, 0, duration) -- sproud smack like
        return dsp.subEffect.NONE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SLOW
    end
end;

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200)) -- repop 60-70min
end
