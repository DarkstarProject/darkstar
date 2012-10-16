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
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local mobTP = mob:getTP();
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			if(mobTP <= 100) then 
				local duration = 60;
			elseif(mobTP <= 200) then 
				local duration = 90;
			else 
				local duration = 120; 
			end
			target:addStatusEffect(typeEffect,30,0,duration);
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
