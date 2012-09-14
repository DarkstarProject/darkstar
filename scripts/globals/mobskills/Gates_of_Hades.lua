---------------------------------------------
--  Gates of Hades
--
--  Description: Deals severe Fire damage to enemies within an area of effect. Additional effect: Burn
--  Type:  Magical
--  
--  
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 20' radial
--  Notes: Only used when a cerberus's health is 25% or lower (may not be the case for Orthrus). The burn effect takes off upwards of 20 HP per tick.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    isEnfeeble = true;
    typeEffect = EFFECT_BURN;
    statmod = MOD_INT;
    accrand = math.random(1,8);
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
		
    if(resist > 0.5 and accrand ~= 1) then
		if(resist >= 1) then  -- Added just incase resist number retuns a value higher then .9.
			resist = .9;
		end
	    power = ((resist * 10) - 5) * math.random(1,2) + 19; -- makes dot damage between 20 - 28, based off resistance and random variable.
		tic = 3;
		duration = 60;
		
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;