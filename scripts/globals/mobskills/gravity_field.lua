---------------------------------------------
-- Gravity Field
-- Entangles all targets in an area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.SLOW
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1250, 0, 120))

    return typeEffect
end
