---------------------------------------------
--  Calcifying Deluge
--
--  Description: Delivers a threefold ranged attack to targets in an area of effect. Additional effect: Petrification
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown
--  Notes: Used only by Medusa.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PETRIFICATION;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,1,0,120);--power=1;tic=0;duration=120;
		end
	end

	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
