---------------------------------------------------
-- Horrid Roar
-- Dispels a single buff at random which could be food. It does not reset hate. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	local effect = target:dispelStatusEffect();
	return effect;
	
end