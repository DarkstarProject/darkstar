-----------------------------------
-- Ability: Mana Wall
-- Allows you to take Damage with MP 
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
	player:addStatusEffect(EFFECT_MANA_WALL,1,0,300);
end;