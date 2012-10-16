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
	local typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
		local statmod = MOD_INT;
		local mobTP = mob:getTP();
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.5) then
			if(mobTP <= 100) then 
				local silenceTime = 30;
			elseif(mobTP <= 200) then 
				local silenceTime = 40;
			else 
				local silenceTime = 60; 
			end
			target:addStatusEffect(typeEffect,1,0,silenceTime);
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = .5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
