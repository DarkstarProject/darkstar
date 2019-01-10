---------------------------------------------
-- Eternal Damnation
-- Description: Inflicts Doom upon an enemy.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.DOOM

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 10, 3, 30))

    return typeEffect
end
