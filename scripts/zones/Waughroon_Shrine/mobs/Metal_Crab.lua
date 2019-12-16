-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Metal Crab
-- BCNM: Crustacean Conundrum
-- TODO: You can only do 0-2 damage no matter what your attack is.
-----------------------------------
require("scripts/globals/weather")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    if VanadielDayElement() == dsp.day.WATERSDAY then
        mob:setMod(dsp.mod.REGEN, 6, 3, 0)
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.HP_DRAIN)
end

function onMobDeath(mob, player, isKiller)
end
