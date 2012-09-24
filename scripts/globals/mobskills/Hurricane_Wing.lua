---------------------------------------------
--  Hurricane Wing
--
--  Description: Deals hurricane-force wind damage to enemies within a very wide area of effect. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Dragua, Fafnir, Nidhogg, Cynoprosopi, Wyrm, and Odzmanouk. The blinding effect does not last long 
--                but is very harsh. The attack is wide enough to generally hit an entire alliance.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
			if(resist > 0.5) then
				target:addStatusEffect(typeEffect,60,0,20);
			end
		end
	end

	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
