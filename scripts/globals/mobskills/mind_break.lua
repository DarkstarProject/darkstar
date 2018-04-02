---------------------------------------------
-- Mind Break
--
-- Description: Reduces maximum MP in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' radial
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local message = msgBasic.SKILL_MISS;
    local typeEffect = dsp.effects.MAX_MP_DOWN;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 42, 0, 120));

    return typeEffect;
end;
