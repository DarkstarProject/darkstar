---------------------------------------------
--  Spoil
--
--  Description: Lowers the strength of target.
--  Type: Enhancing
--  Utsusemi/Blink absorb: Ignore
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
        local typeEffect = EFFECT_STR_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 0, 120));

    return typeEffect;
end;
