---------------------------------------------------
-- Chaotic Strike
-- Ramuh delivers a three-hit attack that also stuns target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	if(applyPlayerResistance(mob,skill,target,mob:getMod(MOD_INT)-target:getMod(MOD_INT),EFFECT_STUN,MOD_INT) > 0.5) then
		if(target:hasStatusEffect(EFFECT_STUN) == false) then
			target:addStatusEffect(EFFECT_STUN,1,0,15);
		end
	end
	
	local numhits = 3;
	local accmod = 2;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);
	return dmg;
	
end