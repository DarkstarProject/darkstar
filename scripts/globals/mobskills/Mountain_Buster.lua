---------------------------------------------------
-- Mountain Buster
-- Titan delivers an earth-shattering attack that roots its target in place.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 2;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

	if(applyPlayerResistance(mob,skill,target,true,EFFECT_BIND,MOD_INT) > 0.5 and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		if(target:hasStatusEffect(EFFECT_BIND) == false) then
			target:addStatusEffect(EFFECT_BIND,1,0,120);
		end
	end

	target:delHP(dmg);
	return dmg;

end