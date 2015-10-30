---------------------------------------------
--  Sandspray
--  Family: Qiqurn
--  Description: Blinds enemies within a fan-shaped area originating from the user.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
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
    local typeEffect = EFFECT_BLINDNESS;
    local power = 25;
    local duration = 90;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

    return typeEffect;
end;
