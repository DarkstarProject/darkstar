---------------------------------------------
--  Tackle
--  Description: Stuns target. Chance of stunning varies with TP.
--  Type: Physical
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	if(target:getID() < 1000000) then target:showText(mob,TAKE_THAT_YOU_WHIPPERSNAPPER); end


	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

	local typeEffect = EFFECT_STUN;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		target:addStatusEffect(typeEffect,1,0,math.random(2,6));--power=1;tic=0;duration=4;
	end

	target:delHP(dmg);
	return dmg;
end;
