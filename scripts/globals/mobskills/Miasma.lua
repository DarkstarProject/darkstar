---------------------------------------------
--  Miasma
--
--  Description: Releases a toxic cloud on nearby targets. Additional effects: Slow + Poison + Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local duration = 180;

	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
	if(resist > 0.5) then
		if(target:hasStatusEffect(EFFECT_POISON) == false) then
			target:addStatusEffect(EFFECT_POISON,1,10,duration);
		end
		if(target:hasStatusEffect(EFFECT_SLOW) == false) then
			target:addStatusEffect(EFFECT_SLOW,20,0,duration);
		end
		if(target:hasStatusEffect(EFFECT_PLAGUE) == false) then
			target:addStatusEffect(EFFECT_PLAGUE,25,0,duration);
		end
	end

	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
