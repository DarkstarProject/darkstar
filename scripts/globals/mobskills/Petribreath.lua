---------------------------------------------
--  Petribreath
--
--  Description: Petrifies targets within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown  cone, Seen up to 15' distance.
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
    local typeEffect = EFFECT_PETRIFICATION;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));

    return typeEffect;
end;
