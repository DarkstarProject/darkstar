-----------------------------------
-- Ability: Shikikoyo
-- @editor Katrinka (SinisterSkies)
-- @version 131221
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------
function OnAbilityCheck(player,target,ability)
	if (player:getTP() <= 100) then
		return MSGBASIC_NOT_ENOUGH_TP, 0;
	end
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local pTP = -(100 - player:getTP());

	if (pTP > 0) then
		player:setTP(100);
		target:setTP(target:getTP() + pTP + (12 - player:getMerit(MERIT_SHIKIKOYO)));
	end
	
end;