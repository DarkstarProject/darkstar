---------------------------------------------
--  Bubble Armor
--
--  Description: Reduces magical damage received by 50%
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:Nightmare Crabs use an enhanced version that applies a Magic Defense Boost that cannot be dispelled.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SHELL;
    local power = 128;

    if(target:addStatusEffect(typeEffect, power, 0, 180)) then
        skill:setMsg(MSG_BUFF);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return typeEffect;
end;
