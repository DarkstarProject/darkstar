---------------------------------------------
-- Aeolian Void
--
-- Description: Fan AoE damage plus Silence and Blind
-- Type: Earth Damage/Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target,mob,skill)
    local typeEffectOne = dsp.effect.SILENCE
    local typeEffectTwo = dsp.effect.BLINDNESS

    MobStatusEffectMove(mob,target,typeEffectOne,1,0,60)
    MobStatusEffectMove(mob,target,typeEffectTwo,15,0,60)

    local dmgmod = MobBreathMove(mob,target, 0.25,2.5,dsp.magic.ele.EARTH,300)
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.EARTH,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.EARTH)
    return dmg
end
