---------------------------------------------
--  Numbing Glare
--  Description: Paralyze opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
--  Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CURSE_I;


    skill:setMsg(MobGazeMove(mob, target, typeEffect, 30, 0, 360));

    return typeEffect;
end;
