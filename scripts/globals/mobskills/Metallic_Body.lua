require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_STONESKIN;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,base,0,30);
	return typeEffect;
end;
