-----------------------------------
-- Ability: Release
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:despawnPet();
	target:delStatusEffect(EFFECT_AVATAR);
end;
