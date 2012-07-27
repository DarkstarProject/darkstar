---------------------------------------------
--  Healing Stomp
--
--  Description: Stomps the ground to apply regeneration.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Only used by notorious monsters.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 5;
    duration = 180;

    typeEffect = EFFECT_REGEN;
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