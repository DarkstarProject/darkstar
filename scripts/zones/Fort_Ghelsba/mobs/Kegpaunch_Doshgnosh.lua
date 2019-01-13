-----------------------------------
-- Area: Fort Ghelsba
--   NM: Kegpaunch Doshgnosh
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.ceil(damage * 0.50) -- "he hit me 40-ish excluding another 20 fire effect."
    local params = {}
    params.bonusmab = 0
    params.includemab = false

    dmg = addBonusesAbility(mob, dsp.magic.ele.FIRE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, dsp.magic.ele.FIRE, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.FIRE)
    dmg = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.FIRE, dmg)

    return dsp.subEffect.FIRE_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
end
