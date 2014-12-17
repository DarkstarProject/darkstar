-----------------------------------
-- Ability: Footwork
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_FOOTWORK,1,0,300);
end;