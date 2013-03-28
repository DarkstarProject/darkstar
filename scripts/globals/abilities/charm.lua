-----------------------------------
-- Ability: Charm a monster
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getPet() ~= nil) then
		return MSGBASIC_ALREADY_HAS_A_PET,0;
	elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
		return MSGBASIC_THAT_SOMEONES_PET,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	player:charmPet(target);
end;
