---------------------------------------------
--  Mind Blast
--
--  Description: Deals lightning damage to an enemy. Additional effect: "Paralysis"
--  Type: Magical (lightning)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Cone
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PARALYSIS

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 180)

    local dmgmod = 1
    local accmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*6,dsp.magic.ele.THUNDER,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHTNING,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.LIGHTNING)
    return dmg
end
