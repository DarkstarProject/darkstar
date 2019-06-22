---------------------------------------------
-- Slaverous Gale
--
-- Description: Deals earth damage that inflicts Plague and Slow effects on targets in front of the caster
-- Type: Magical (Earth)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = dsp.effect.PLAGUE
    local typeEffectTwo = dsp.effect.SLOW
    MobStatusEffectMove(mob, target, typeEffectOne,1,3,60)
    MobStatusEffectMove(mob, target, typeEffectTwo, 1250, 0, 60)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * math.random(4, 6), dsp.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
