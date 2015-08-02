---------------------------------------------
--  Namas Arrow
--
--  Additional Effect: Temporarily improves Ranged Accuracy
--  Type: Physical
--  Range: Melee
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2.75,2.75,2.75);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

	local duration = 20;
	
	if(mob:getTP() == 300) then
		duration = 60;
	elseif(mob:getTP() >= 200) then
		duration = 40;
	end
	
	MobBuffMove(mob, EFFECT_ACCURACY_BOOST, 30, 0, duration);
	
	target:delHP(dmg);
	return dmg;
	
end;