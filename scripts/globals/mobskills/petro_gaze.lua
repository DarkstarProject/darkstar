---------------------------------------------
-- Petro Gaze
-- Description: Petrifies opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-- Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/zone")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getCurrentRegion() == dsp.region.TAVNAZIANARCH) then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PETRIFICATION

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 25))

    return typeEffect
end
