---------------------------------------------
--  Choke Breath
--
--  Frontal AOE. Damages all targets in range and causes Silence and Paralysis. 
--  Type: Breath
--  Utsusemi/Blink absorb: Blockable with one to three Utsusemi shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;
	local typeEffect = EFFECT_SILENCE;
	local power = 20;
	local tick = 3;
	local duration = power * tick;

	MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);

    local dmgmod = MobBreathMove(mob, target, 0.1, 1, ELE_WIND, 200);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WIND,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
