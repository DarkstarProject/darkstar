---------------------------------------------------
-- Chaotic Strike
-- Ramuh delivers a three-hit attack that also stuns target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)


	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1.1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);

	local typeEffect = EFFECT_STUN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_THUNDER);
		if(MobPhysicalHit(skill, dmg, target, info.hitslanded) and resist > 0.2) then
				target:addStatusEffect(typeEffect,1,0,10*resist);
			end

		end
	end
	return dmg;

end