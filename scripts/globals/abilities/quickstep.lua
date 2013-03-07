-----------------------------------
-- Ability: Quickstep
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

--Uncomment these when implemented
function OnAbilityCheck(player,target,ability)
	--if (player:getTP() < 10) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	--else
	--	return 0,0;
	--end
end;

function OnUseAbility(player, target, ability)
	--player:delTP(10);
end;