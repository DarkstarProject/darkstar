-----------------------------------
-- Ability: Sic.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if (player:getPet():getHP() == 0) then
			return MSGBASIC_UNABLE_TO_USE_JA,0;
		elseif (not player:getPet():hasTarget()) then
			return MSGBASIC_PET_CANNOT_DO_ACTION,0;
		elseif (not player:getPet():hasTPMoves()) then
			return MSGBASIC_UNABLE_TO_USE_JA,0;
		else
			return 0,0;
		end
	end
end;

function OnUseAbility(player, target, ability)
end;
