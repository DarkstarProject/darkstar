---------------------------------------------
--  Immortal Anathema
--
--  Description: Inflicts a curse on all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: AoE
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
    local typeEffect = EFFECT_CURSE_I;

    local msg = MobStatusEffectMove(mob, target, typeEffect, 25, 0, 300);

    skill:setMsg(msg);

    return typeEffect;
end;
