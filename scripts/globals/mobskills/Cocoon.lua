---------------------------------------------------
-- Cocoon
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_DEFENSE_BOOST) ~= nil) then
		mob:delStatusEffect(EFFECT_DEFENSE_BOOST);
	end
	mob:addStatusEffect(EFFECT_DEFENSE_BOOST,50,0,30); -- 50%
	return EFFECT_DEFENSE_BOOST;
	
end