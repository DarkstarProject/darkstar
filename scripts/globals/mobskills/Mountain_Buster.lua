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

	local typeEffect = EFFECT_BIND;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
	if(resist > 0.2 and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		if(target:hasStatusEffect(typeEffect) == false) then
			target:addStatusEffect(typeEffect,1,0,120*resist);
		end
	end

	target:delHP(dmg);
	return dmg;

end