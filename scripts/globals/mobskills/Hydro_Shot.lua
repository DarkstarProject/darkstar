---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ENMITY_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_MND;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,7);
		if(resist > 0.5) then
			local mobTP = mob:getTP();
			if(mobTP <= 100) then 
				local duration = 15;
			elseif(mobTP <= 200) then 
				local duration = 30;
			else 
				local duration = 45; 
			end
			target:addStatusEffect(typeEffect,30,0,duration);
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
