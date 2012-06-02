---------------------------------------------------
-- Meteorite
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	dint = pet:getStat(MOD_INT) - target:getStat(MOD_INT);
	dmg = 500 + dint*1.5 + skill:getTP()/2;
	target:updateEnmityFromDamage(pet,dmg);
	return dmg;
end