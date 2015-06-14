---------------------------------------------
--  Impale
--
--  Description: Deals damage to a single target. Additional effect: Paralysis
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local isNM = mob:isMobType(MOBTYPE_NOTORIOUS);

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.3;

	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);

	local shadows = info.hitslanded;

	if(isNM) then
		shadows = MOBPARAM_IGNORE_SHADOWS;
	end

	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,shadows);

	local typeEffect = EFFECT_PARALYSIS;
	local power = 20;

	if(isNM) then
		typeEffect = EFFECT_POISON;
	end


    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, 120);

	target:delHP(dmg);
	return dmg;
end;
