---------------------------------------------
--  Dreadstorm
--
--  Description: Deals magical damage in an area of effect. Additional effect: Terror
--  Type: Magical
--  Wipes Shadows
--  Range: 30' radial
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

-- TODO: Add EFFECT_TERROR once it actually does something.

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 10,ELE_DARK,dmgmod,TP_MAB_BONUS,5);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	mob:resetEnmity(target);
	return dmg;
end;
