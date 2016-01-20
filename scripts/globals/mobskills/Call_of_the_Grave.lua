---------------------------------------------
--  Call of the Grave
--
--  Description: Lowers INT of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
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
    local typeEffect = EFFECT_INT_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120));

    return typeEffect;
end;
