---------------------------------------------------
-- Refueling
-- Steals an enemy's HP. Ineffective against undead.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_HASTE) ~= nil) then
		mob:delStatusEffect(EFFECT_HASTE);
	end
	mob:addStatusEffect(EFFECT_HASTE,10,0,240);
	return EFFECT_HASTE;
	
end