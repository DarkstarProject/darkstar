-----------------------------------
-- Ability: Snarl, transfer hate to the jug pet.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if ((player:getPet():getTarget() ~= nil) and (player:isJugPet())) then
			player:setBattleSubTarget(player:getPet());
			return 0,0;
		else
			return MSGBASIC_PET_CANNOT_DO_ACTION,0;
		end
	end
end;

function onUseAbility(player, target, ability)
	return 0,0;
end;
