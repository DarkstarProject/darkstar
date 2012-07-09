---------------------------------------------
--  Howl
--
--  Description: Grants the effect of Warcry to user and any linked allies.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
    power = 1;
    tic = 0;
    duration = 240;

    typeEffect = EFFECT_WARCRY;
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