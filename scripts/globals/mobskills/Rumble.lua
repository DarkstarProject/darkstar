---------------------------------------------
--  Rumble
--
--  Description: A disorienting vibration lowers evasion of targets in an area of effect.
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
    local typeEffect = EFFECT_EVASION_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 120));

    return typeEffect;
end;
