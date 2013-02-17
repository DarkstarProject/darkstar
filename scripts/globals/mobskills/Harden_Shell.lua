---------------------------------------------
--  Harden Shell
--
--  Description: Enhances defense.
--  Type: Magical (Earth)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_BOOST;
    mob:delStatusEffect(typeEffect);
    mob:delStatusEffect(EFFECT_DEFENSE_DOWN);
	mob:addStatusEffect(typeEffect,100,0,60);--power=100;tic=0;duration=60;
	skill:setMsg(MSG_BUFF);
	return typeEffect;
end;
