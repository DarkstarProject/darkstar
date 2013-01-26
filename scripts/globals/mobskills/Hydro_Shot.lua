---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
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
	local dmgmod = math.random(2.5,3.5);
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

	local typeEffect = EFFECT_ENMITY_DOWN;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_MND;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,7);
		if(resist > 0.2) then
			local duration;
			local mobTP = mob:getTP();
			if(mobTP <= 100) then
				duration = 15;
			elseif(mobTP <= 200) then
				duration = 30;
			else
				duration = 45;
			end
			target:addStatusEffect(typeEffect,30,0,duration);
		end
	end

	target:delHP(dmg);
	return dmg;
end;
