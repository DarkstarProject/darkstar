-----------------------------------
-- Ability: Divine Emblem
-- Enhances the accuracy of your next
-- divine magic spell and increases
-- enmity.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	if(player:hasStatusEffect(EFFECT_ELEMENTAL_SEAL) == true) then
		player:delStatusEffect(EFFECT_ELEMENTAL_SEAL);
	end
	player:addStatusEffect(EFFECT_DIVINE_EMBLEM,1,0,60);
end;
