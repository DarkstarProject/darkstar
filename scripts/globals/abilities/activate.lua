-----------------------------------
-- Ability: Activate
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
	elseif (not player:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA,0;
    else
        return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	player:spawnPet(PET_AUTOMATON);
end;
