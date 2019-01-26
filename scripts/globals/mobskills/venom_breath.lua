---------------------------------------------
--
-- Venom Breath
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.POISON
    MobStatusEffectMove(mob, target, typeEffect, math.random(20,40), 3, 60)

    local dmgmod = MobBreathMove(mob, target, 0.3, 1.875, dsp.magic.ele.WATER, 500)
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.ICE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.ICE)
    return dmg
end
