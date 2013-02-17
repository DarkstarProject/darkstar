---------------------------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

	local typeEffect = EFFECT_ATTACK_DOWN;
	if(MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WATER);
		if(resist > 0.2) then
			target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,75,0,120*resist);--power=50;tic=0;duration=60;
		end
	end

	target:delHP(dmg);
	return dmg;
end;
