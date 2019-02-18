-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Patripatan
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 10) -- "Noted Double Attack"
    mob:addMod(dsp.mod.REGAIN, 50) -- "fairly potent Regain effect"
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PARALYZE)
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 63, 1, dsp.regime.type.FIELDS)
end
