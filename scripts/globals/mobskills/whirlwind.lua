---------------------------------------------
--  Whirlwind
--
--  Description: Deals wind damage to enemies within range. Additional effect: VIT Down.
--  Type: Magical (Wind)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.VIT_DOWN

    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, dsp.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    return dmg
end
