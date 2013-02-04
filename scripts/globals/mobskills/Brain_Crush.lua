---------------------------------------------------
-- Brain Crush
-- Deals damage to single target. Additional effect: Silence
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
	local dmgmod = math.random(1, 2);
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);

	local typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
		local statmod = MOD_INT;
		local mobTP = mob:getTP();
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WIND);
		if(resist > 0.2) then
			local silenceTime = 60;
			if(mobTP <= 100) then
				silenceTime = 30;
			elseif(mobTP <= 200) then
				silenceTime = 40;
			end
			target:addStatusEffect(typeEffect,1,0,silenceTime);
		end
	end

	return dmg;
end;
