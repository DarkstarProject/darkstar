---------------------------------------------
--  Grim Reaper
--
--  Description: Deals damage in a threefold attack to targets in a fan-shaped area of effect. Additional effect: Doom
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown cone
--  Notes: Used only by certain Lamia NMs (e.g. Lamia No.3). If they lost their staff, they'll use Hysteric Barrage instead.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
--[[
	local power = 1;
	local tic = 0;
	local duration = 60;

	isEnfeeble = true;
	typeEffect = EFFECT_POISON;
	statmod = MOD_INT;

	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:hasStatusEffect(typeEffect) == false) then
			target:addStatusEffect(typeEffect,power,tic,duration);
		end
	end
	]]
	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);

	return dmg;
end;
