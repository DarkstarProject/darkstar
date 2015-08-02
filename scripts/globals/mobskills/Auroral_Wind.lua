---------------------------------------------
--  Auroral Wind
--
--  Family: Aern
--  Type: Magical
--  Can be dispelled: N/A
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
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
	local typeEffect = EFFECT_SILENCE;

	MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60);

	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);

	return dmg;

end;