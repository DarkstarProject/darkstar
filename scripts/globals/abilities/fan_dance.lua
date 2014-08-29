-----------------------------------
-- Ability: Fan Dance
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
	player:addStatusEffect(EFFECT_FAN_DANCE,90,0,300);
end;