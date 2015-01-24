-----------------------------------
-- Ability: Azure Lore
-- Enhances the effect of blue
-- magic spells.
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_AZURE_LORE,1,0,30);
end;