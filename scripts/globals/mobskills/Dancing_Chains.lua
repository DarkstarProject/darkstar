---------------------------------------------
--  Dancing Chains
--
--  Description: Additional effect: Drown
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DROWN;
    local power = mob:getMainLvl() / 3

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, 60));

    return typeEffect;
end;
