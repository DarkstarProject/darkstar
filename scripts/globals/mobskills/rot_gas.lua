---------------------------------------------
-- Rot Gas
--
-- Description: Inflicts enemies in an area of effect with a disease.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.DISEASE
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 180))

    return typeEffect
end
