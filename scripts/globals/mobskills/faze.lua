---------------------------------------------
--  Faze
--  Family: Qiqurn
--  Description: Scares a single target.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Target has to be facing user
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;
    local duration = 5;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));

    return typeEffect;
end;
