---------------------------------------------------
-- Shell Guard
-- Increases defense of user.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_PROTECT) ~= nil) then
		mob:delStatusEffect(EFFECT_PROTECT);
	end
	mob:addStatusEffect(EFFECT_PROTECT,base,0,180);
	return EFFECT_PROTECT;
	
end