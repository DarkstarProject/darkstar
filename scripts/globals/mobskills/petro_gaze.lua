---------------------------------------------
-- Petro Gaze
-- Description: Petrifies opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-- Known users: Hecteyes in CoP areas, Sobbing Eyes in Under Observation, Shoggoth
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PETRIFICATION

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 25))

    return typeEffect
end
