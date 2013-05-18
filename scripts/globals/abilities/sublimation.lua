-----------------------------------
-- Ability: Sublimation
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	
	if (player:hasStatusEffect(EFFECT_SUBLIMATION_COMPLETE) then
		
	end
    return EFFECT_LIGHT_ARTS;
end;