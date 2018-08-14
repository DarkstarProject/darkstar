---------------------------------------------
-- Discoid
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 10000 / skill:getTotalTargets()
    local dmg = MobFinalAdjustments(needles, mob, skill, target, MOBSKILL_MAGICAL, MOBPARAM_LIGHT, MOBPARAM_WIPE_SHADOWS)

    target:delHP(dmg)

    return dmg
end