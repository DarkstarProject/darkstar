---------------------------------------------
--  Flame Armor
--
--  Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    power = 50;
    tic = 0;
    duration = 180;

    typeEffect = EFFECT_BLAZE_SPIKES;
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