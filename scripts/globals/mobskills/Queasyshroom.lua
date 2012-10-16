---------------------------------------------------
-- Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP.
-- Range is 13.5 yalms.
-- Piercing damage Ranged Attack.
-- Secondary modifiers: INT: 20%.
-- Additional Effect: Poison is 3 HP/tick.
-- Poison effect may not always process.
-- Removes all Shadow Images on the target. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_POISON;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
			if(resist > 0.5) then
				local mobTP = mob:getTP();
				if(mobTP <= 100) then 
					local poisontime = 60;
				elseif(mobTP <= 200) then 
					local poisontime = 120;
				else 
					local poisontime = 180; 
				end
				target:addStatusEffect(typeEffect,1,3,poisontime);
			end
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
