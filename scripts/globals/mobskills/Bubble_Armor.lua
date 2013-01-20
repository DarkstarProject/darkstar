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
    skill:setMsg(MSG_BUFF);
    if(mob:hasStatusEffect(typeEffect) == true) then
        local oldEffect = mob:getStatusEffect(typeEffect);
        oldEffect:setPower(-128);
        oldEffect:setDuration(60);
    else
        mob:addStatusEffect(typeEffect,-128,0,60);--power=-128;tic=0;duration=60;
    end
    return typeEffect;
end;
