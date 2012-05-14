-----------------------------------
-- Ability: Call Beast
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	--TODO: Look at ammo slot for jug pet type etc
	player:spawnPet(23);
end;
