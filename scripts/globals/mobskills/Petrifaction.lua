---------------------------------------------
--  Petrifaction
--  Description: Petrifies opponent with a gaze attack
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
end;

function onMobWeaponSkill(target, mob, skill)

    local typeEffect = EFFECT_PETRIFICATION;
    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 25));
    return typeEffect;
end;