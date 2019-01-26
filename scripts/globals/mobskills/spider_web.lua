---------------------------------------------
-- Spider Web
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
    local power = 3000

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 90))

    return typeEffect
end
