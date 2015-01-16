-----------------------------------
-- Ability: Meikyo Shisui
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
	player:addStatusEffect(EFFECT_MEIKYO_SHISUI,1,0,30);
	player:addTP(300);
end;