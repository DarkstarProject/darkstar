---------------------------------------------
--  Rot Gas
--
--  Description: Inflicts enemies in an area of effect with a disease.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DISEASE;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 180));

    return typeEffect;
end;
