-----------------------------------
-- Ability: Call Wyvern
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	player:spawnPet(PET_WYVERN);
end;
