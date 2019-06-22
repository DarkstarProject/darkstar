---------------------------------------------
-- 2000 Needles
--
-- Description: Shoots multiple needles at enemies within range.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 2000 / skill:getTotalTargets()

    local dmg = MobFinalAdjustments(needles,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.LIGHT,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.LIGHT)

    return dmg
end
