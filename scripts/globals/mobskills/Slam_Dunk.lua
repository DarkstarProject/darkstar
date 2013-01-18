---------------------------------------------------
-- Slam Dunk
-- Deals damage to a single target. Additional effect: bind
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.2) then
			local mobTP = mob:getTP();
			local duration = mob:getMainLvl()/3.75;
			if(mobTP <= 100) then
				local duration = 10 + duration;
			elseif(mobTP <= 200) then
				local duration = 15 + duration;
			else
				local duration = 20 + duration;
			end
			target:addStatusEffect(typeEffect,1,0,duration);
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1.4;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
