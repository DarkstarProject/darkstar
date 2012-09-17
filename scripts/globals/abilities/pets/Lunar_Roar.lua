---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	target:dispelStatusEffect();
	target:dispelStatusEffect();
	skill:setMsg(0);
	return 0;
end