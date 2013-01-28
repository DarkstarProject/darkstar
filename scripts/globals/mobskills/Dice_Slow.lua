---------------------------------------------
--  Goblin Dice
--
--  Description: Stun
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLOW;
    if(target:hasStatusEffect(typeEffect) == false) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:delStatusEffect(EFFECT_HASTE);
        target:addStatusEffect(typeEffect,25,0,120);--power=20;tic=0;duration=120;
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    if(target:hasStatusEffect(EFFECT_SLEEP_I) == false) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:addStatusEffect(EFFECT_SLEEP_I,1,0,math.random(20,30));--power=20;tic=0;duration=120;
    end

    return typeEffect;
end;
