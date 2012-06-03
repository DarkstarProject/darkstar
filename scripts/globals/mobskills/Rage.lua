---------------------------------------------
--  Rage
--
--  Description: The Ram goes berserk
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: 50% Attack Boost.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)


    power = 50;
    tic = 0;
    duration = 60;

    typeEffect = EFFECT_ATTACK_BOOST;
    skill:setMsg(MSG_BUFF);
    if(mob:hasStatusEffect(typeEffect) == true) then
        oldEffect = mob:getStatusEffect(typeEffect);
        oldEffect:setPower(power);
        oldEffect:setDuration(duration);
    else
        mob:addStatusEffect(typeEffect,power,tic,duration);
	end
    return typeEffect;
end;