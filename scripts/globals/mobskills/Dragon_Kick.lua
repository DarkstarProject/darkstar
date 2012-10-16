---------------------------------------------
--  Dragon Kick
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
	local dmgmod = 0.8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,2.75,3.50);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
