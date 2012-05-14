require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_STONESKIN) ~= nil) then
		mob:delStatusEffect(EFFECT_STONESKIN);
	end
	mob:addStatusEffect(EFFECT_STONESKIN,base);
	return EFFECT_STONESKIN;
end