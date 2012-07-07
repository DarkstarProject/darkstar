---------------------------------------------
--  Tackle
--  Description: Stuns target. Chance of stunning varies with TP. 
--  Type: Physical
---------------------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("scripts/zones/Horlais_Peak/TextIDs");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	target:showText(mob,TAKE_THAT_YOU_WHIPPERSNAPPER);
	
	isEnfeeble = true;
	typeEffect = EFFECT_STUN;
	statmod = MOD_INT;
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_STUN) == nil) then
			target:addStatusEffect(EFFECT_STUN,1,0,4);
		end
	end
	
    numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
	
end;