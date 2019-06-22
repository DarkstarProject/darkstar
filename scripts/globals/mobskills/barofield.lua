---------------------------------------------
--  Barofield
--
--  Description: Deals Wind damage to enemies within a fan-shaped area. Additional effect: Weight
--  Type: Magical
--  Ignores Shadows
--  Range: 15' Cone
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2,dsp.magic.ele.WIND,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, dsp.effect.WEIGHT, 25, 0, 60)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    return dmg
end
