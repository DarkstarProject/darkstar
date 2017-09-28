---------------------------------------------
--  Numbing Noise
--
--  Description: Creates an unsettling sound. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: Ignore
--  Range: 10' cone
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
    local typeEffect = EFFECT_STUN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 5));

    return typeEffect;
end;
