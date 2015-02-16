-----------------------------------
-- Ability: Avatar's Favor
-- Channels the avatar's power 
-- towards a beneficial status 
-- effect for the party members 
-- within range.
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
    
end;