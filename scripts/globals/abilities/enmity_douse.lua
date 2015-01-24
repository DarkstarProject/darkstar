-----------------------------------
-- Ability: Enmity Douse
-- Reduces target's enmity towards
-- you.
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
	target:resetEnmity(player);
	target:updateEnmity(player,1,0);
end;