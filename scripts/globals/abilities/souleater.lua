-----------------------------------
-- Ability: Souleater
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
   player:addStatusEffect(EFFECT_SOULEATER,1,0,60);
end;