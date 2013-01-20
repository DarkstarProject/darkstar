---------------------------------------------
--  Numbing Noise
--
--  Description: Creates an unsettling sound. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: Ignore
--  Range: 10' cone
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
    local typeEffect = EFFECT_STUN;
    if(target:hasStatusEffect(typeEffect) == false) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:addStatusEffect(typeEffect,1,0,math.random(4,8));--power=1;tic=0;duration=5;
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
