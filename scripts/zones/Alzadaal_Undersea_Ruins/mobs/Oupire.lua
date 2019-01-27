-----------------------------------
-- Area: Alzadaal Undersea Ruins
--   NM: Oupire
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PLAGUE)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OUPIRE_IMPALER)
end