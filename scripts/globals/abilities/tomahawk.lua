-----------------------------------
-- Ability: Tomahawk 
-- Expends a throwing tomahawk
-- to inflict a special defense
-- down effect on an enemy. 
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getEquipID(SLOT_AMMO) ~= 18258) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
end;