---------------------------------------------------
--Asuran Claws
--Gnole Mobs, only used when standing
---------------------------------------------------
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	if(mob:AnimationSub() ==1)
		return 1;
	else	
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local numhits = 6;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);

	return dmg;
end;
