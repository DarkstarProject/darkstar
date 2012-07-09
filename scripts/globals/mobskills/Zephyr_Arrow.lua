---------------------------------------------
--  Zephyr Arrow
--
--  Description: Deals a ranged attack to target. Additional effect: Knockback &amp; Bind
--  Type: Ranged
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: Unknown
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    power = 1;
    tic = 0;
    duration = 120;

    isEnfeeble = true;
    typeEffect = EFFECT_BIND;
    statmod = MOD_INT;
    
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
	
	numhits = 1;
	accmod = 4;
	dmgmod = 5;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end;