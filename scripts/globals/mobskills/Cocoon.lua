---------------------------------------------------
-- Cocoon
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	def = mob:getMod(MOD_DEF) / 2;
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_DEFENSE_BOOST) ~= nil) then
		mob:delStatusEffect(EFFECT_DEFENSE_BOOST);
	end
	mob:addStatusEffect(EFFECT_DEFENSE_BOOST,def,0,30);
	return EFFECT_DEFENSE_BOOST;
	
end