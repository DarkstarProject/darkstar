---------------------------------------------
--  Warm-Up
--
--  Description: Enhances accuracy and evasion.
--  Type: Magical (Earth)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending

    skill:setMsg(MobBuffMove(target, EFFECT_EVASION_BOOST, base, 0, 180));
    skill:setMsg(MobBuffMove(target, EFFECT_ACCURACY_BOOST, base, 0, 180));

	return EFFECT_ACCURACY_BOOST;
end;
