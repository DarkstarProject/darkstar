---------------------------------------------------
-- self_destruct_321
-- Weapon skill for Time Bomb (BCNM 50 3,2,1...)
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local amount = 9999 * skill:getTotalTargets()
    local dmg = MobFinalAdjustments(amount,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.FIRE,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.FIRE)
    return dmg
end
