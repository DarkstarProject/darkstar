---------------------------------------------
--  Jettatura
--  Family: Hippogryph
--  Description: Enemies within a fan-shaped area originating from the caster are frozen with fear.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows 
--  Range: Cone gaze
--  Notes:
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
    local duration = 10;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));

    return typeEffect;
end;