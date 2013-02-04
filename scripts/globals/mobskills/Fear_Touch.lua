---------------------------------------------------
-- Fear Touch
-- Touches a single target. Additional effect: Slow
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
	local dmgmod = 2.3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local mobTP = mob:getTP();
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			local duration;
			if(mobTP <= 100) then
				duration = 60;
			elseif(mobTP <= 200) then
				duration = 90;
			else
				duration = 120;
			end
            target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(typeEffect,30,0,duration);
		end
	end

	target:delHP(dmg);
	return dmg;
end;
