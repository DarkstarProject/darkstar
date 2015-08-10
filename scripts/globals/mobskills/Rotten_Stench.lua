---------------------------------------------
--  Rotten Stench
--
--  Description: Reduces accuracy and magical accuracy in area of effect
--  Type: Magical (Wind)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local duration = 120;


	MobStatusEffectMove(mob, target, EFFECT_ACCURACY_DOWN, 10, 0, 120);
	MobStatusEffectMove(mob, target, EFFECT_MAGIC_ACC_DOWN, 10, 0, 120);
	
    return typeEffect;
end;
