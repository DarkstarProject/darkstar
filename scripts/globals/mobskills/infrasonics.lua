---------------------------------------------
-- Infrasonics
-- Reduces evasion of targets in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.EVASION_DOWN

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120))

    return typeEffect
end