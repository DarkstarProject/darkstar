---------------------------------------------
--  Freeze Rush
--
--  Description: Makes an icy charge at a single target.
--  Type: Magical
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
	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_ICE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
